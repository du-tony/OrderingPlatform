const { BadRequestError } = require('../errors');
const validator = require('validator');
const UserModel = require('../models/UserModel')

const validateUserData = async (req, res, next) => {
    const { username, email, confirm_email, password, confirm_password, phone} = req.body;

    if (!username || !email || !password || !phone) {
        return next(new BadRequestError('Please provide username, email, password, and phone number.'));
    }
    if (password.length < 6) {
        return next(new BadRequestError('Password should at least have a length of 6.'));
    }
    if (password !== confirm_password) {
        return next(new BadRequestError('Password mismatched.'));
    }
    if (email !== confirm_email) {
        return next(new BadRequestError('Email mismatched.'));
    }
    if (!validator.validate(email)) { // Assuming 'validator' is properly imported
        return next(new BadRequestError('Wrong Email Format.'));
    }
    const existingUser = await UserModel.findUserByEmail(email);
    if (existingUser) {
      return next(new BadRequestError('Email already exists.'));
    }
    next(); 
};
const validateUserId = async(req,res,next)=>{
    const {userId} = req.params;
    const doctor = await UserModel.getUserInfoWithoutPasswordById(userId);
    if (!doctor) {
      return next(new BadRequestError(`Invalid User Id ${userId}`));
    }
    next()
}
const validateUserEmail = async(req,res, next)=>{
    const {email} = req.body;
    if (!validator.validate(email)) {
        return next(new BadRequestError('Wrong Email Format.'));
    }
    const existingUser = await UserModel.findUserByEmail(email);
    if (existingUser && existingUser.id!==req.params.userId) {
      return next(new BadRequestError('Email already exists.'));
    }
}
const validateUpdatingData = async (req, res, next) => {
    const { id,username, email, confirm_email, password, confirm_password, phone} = req.body;

    if (!username || !email || !phone) {
        return next(new BadRequestError('Please provide username, email, password, and phone number.'));
    }
    if (password !== confirm_password) {
        return next(new BadRequestError('Password mismatched.'));
    }
    if (email !== confirm_email) {
        return next(new BadRequestError('Email mismatched.'));
    }
    next(); 
};

module.exports = {
    validateUserData,
    validateUpdatingData,
    validateUserId,
    validateUserEmail,
};
