const UserModel = require('../models/UserModel');
const { BadRequestError,InternalServerError } = require('../errors')
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
require('dotenv').config();
const EmailService = require('../services/EmailService');
const CryptoUtils = require('../utils/CryptoUtils');
const asyncWrapper = require('../middleware/async');

const signup = asyncWrapper(async (req, res, next) => {

  const { username, email, password, clinicName, phone, gender } = req.body;
  const roleid = 3;
  const active = 0;
  if (roleid === 3 && !clinicName) {
    return next(new BadRequestError('Please provide Clinic name.'))
  }
    const hashedPassword = bcrypt.hashSync(password);
    const newUser = {
      username,
      email,
      password: hashedPassword,
      roleid,
      clinicName: roleid === 3 ? clinicName : null,
      phone,
      gender,
      active,
    };

    const insertId = await UserModel.createUser(newUser);

    const encryptedUserId = CryptoUtils.encrypt(String(insertId));
    const activateLink = `${process.env.SERVER_HOST}/api/auth/activate/${encryptedUserId}`;

    EmailService.sendEmail(newUser, activateLink);

    res.status(201).json({ message: 'User registered successfully. Awaiting activation.' });
  
});

const signin = asyncWrapper(async (req, res, next) => {
  try {
    const { email, password } = req.body;
    const user = await UserModel.findUserByEmail(email);
    if (!user) {
      return next(new BadRequestError('The email is not registered.' ));
    } else if(user.active ===0){
      return next(new BadRequestError('The account is pending activation.'));
    } else{
      const isPasswordValid = UserModel.verifyPassword(user, password)
      if (!isPasswordValid) {
        return next(new BadRequestError('Password not correct.'));
      }else{
        const token = jwt.sign({
          userid: user.id,
          roleid: user.roleid,
          username: user.username,
          gender: user.gender
        }, process.env.SECRET_KEY, { expiresIn: '24h' });
        res.status(200).json({ message: 'Sign In successful.', token });
      }
    }
  } catch (error) {
    return next(new InternalServerError("Sign In Unsuccessfully."))
  }
});

const activateEncryptedUserId = asyncWrapper(async (req, res, next) => {
  try {
    const { encrypted } = req.params;
    const decryptedUserId = CryptoUtils.decrypt(encrypted); // Implement decryption utility.
    await UserModel.setActive(decryptedUserId);
    res.status(200).json({ message: 'User activated successfully.' });
  } catch (error) {
    return next(new InternalServerError("User activation failure."))
  }
});

const signout = asyncWrapper(async (req, res, next) => {
  res.status(200).json({ message: 'Sigh Out successful.' });
});

module.exports = {
  signup, signin, activateEncryptedUserId, signout
}