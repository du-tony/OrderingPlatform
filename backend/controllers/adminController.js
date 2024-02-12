const UserModel = require('../models/UserModel');
const { BadRequestError } = require('../errors');
require('dotenv').config();
const asyncWrapper = require('../middleware/async')

const activateUserId = asyncWrapper(async (req, res, next) => {
    const { userId } = req.params;
    if(!userId){
        return next(new BadRequestError("Require user id."))
    }else{
        await UserModel.setActive(userId);
        res.status(200).json({ message: 'User activated successfully.' });
    }
    
});

const deactivateUserId = asyncWrapper(async (req, res) => {
    const { userId } = req.params;
    if(!userId){
        return next(new BadRequestError("Require user id."))
    }else{
        await UserModel.setInactive(userId);
        res.status(200).json({ message: 'User deactivated successfully.' });
    }
});


module.exports = {
    activateUserId, deactivateUserId
}