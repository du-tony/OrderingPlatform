const OrderModel = require('../models/OrderModel');
const CategoryModel = require("../models/CategoryModel")
const UserModel = require("../models/UserModel")
const NotificationModel = require('../models/NotificationModel')
const { BadRequestError, InternalServerError, ForbiddenError } = require('../errors');
require('dotenv').config();
const asyncWrapper = require('../middleware/async');
const { sortById } = require('../utils/utilities');
const bcrypt = require('bcryptjs');
require('dotenv').config();

const getOrderList = asyncWrapper(async (req, res, next) => {
    const roleid = req.user.roleid;
    console.log(req.user)
    if (roleid === 1 || roleid === 2) {
        const orderList = await OrderModel.getAllOrderList(null);
        res.status(200).json(orderList)
    } else if (roleid === 3) {
        const orderList = await OrderModel.getOrderListByUserId(req.user.userid);
        res.status(200).json(orderList)
    } else {
        return next(new ForbiddenError("Invalid Role."))
    }
});
const getDoctorCasesByTime = asyncWrapper(async (req, res, next) => {
    const { doctor_id, begin_date, end_date } = req.body;
    if (!doctor_id) {
        return next(new BadRequestError("Require Doctor Id"))
    }
    if (!begin_date) {
        return next(new BadRequestError("Require Begin Date"))
    }
    if (!end_date) {
        return next(new BadRequestError("Require End Date"))
    }
    const orderList = await OrderModel.getDoctorCasesByTime(doctor_id, begin_date, end_date);
    res.status(200).json(orderList)
})
const getAccessibleCategories = asyncWrapper(async (req, res, next) => {
    const roleid = req.user.roleid;
    if (roleid === 1 || roleid === 2) {
        const categories = await CategoryModel.getAllCategories();
        res.status(200).json(categories)
    } else if (roleid === 3) {
        const categories = await CategoryModel.getAccessibleCategoriesByUserId(req.user.userid);
        res.status(200).json(categories)
    } else {
        return next(new ForbiddenError("Invalid Role."))
    }
});

const getAccessDoctorRelation = asyncWrapper(async (req, res, next) => {
    const users = await UserModel.getAllUsers();
    const categories = await CategoryModel.getAllCategories();
    const relations = await CategoryModel.getAllaccess();
    const accessMap = relations.reduce((acc, relation) => {
        const key = `${relation.id}-${relation.category_id}`;
        acc[key] = true;
        return acc;
    }, {});
    users.forEach(user => {
        // Initialize checkBoxes array for each user
        user.checkBoxes = categories.map(category => {
            const key = `${user.id}-${category.id}`;
            return accessMap[key] ? 1 : 0;
        });
    });

    res.status(200).json({"users": users});
})
const grantUserAccess = asyncWrapper(async (req, res, next) => {
    console.log(req.user, req.body)
    const { doctor_id, category_id } = req.body;
    if (!doctor_id || !category_id) {
        return next(new BadRequestError("Required Doctor Id or Category Id"))
    }
    const result = await CategoryModel.grantUserAccess(doctor_id, category_id);
    if (result.affectedRows === 0) {
        res.status(200).json({ msg: "Already Granted." })
    } else if (result.affectedRows === 1) {
        res.status(200).json({ msg: "Successfully Granted." })
    } else {
        return next(new InternalServerError("Database Error"))
    }

});

const forbiddenUserAccess = asyncWrapper(async (req, res, next) => {
    const { doctor_id, category_id } = req.query;
    if (!doctor_id || !category_id) {
        return next(new BadRequestError("Required Doctor Id or Category Id"))
    }
    const result = await CategoryModel.forbiddenUserAccess(doctor_id, category_id);
    if (result.affectedRows === 0) {
        res.status(200).json({ msg: "Already Deleted." })
    } else if (result.affectedRows === 1) {
        res.status(200).json({ msg: "Successfully Deleted." })
    } else {
        return next(new InternalServerError("Database Error"))
    }
});

const createTechnician = asyncWrapper(async (req, res, next) => {
    const { username, email, password, phone, gender, roleid, active } = req.body;

    if (roleid !== 1 || roleid !== 2) {
        return next(new BadRequestError('Must Be Admin Or Technician.'))
    }
    const hashedPassword = bcrypt.hashSync(password);
    const newUser = {
        username,
        email,
        password: hashedPassword,
        roleid,
        clinicName: null,
        phone,
        gender,
        active
    };
    await UserModel.createUser(newUser);
    res.status(201).json({ message: 'Techincian Added Successfully.' });

});

const updateTechnician = asyncWrapper(async (req, res, next) => {
    const { id, username, email, password, roleid, active, gender, phone } = req.body;
    const results = await UserModel.updateTechnician({ id, username, email, password, roleid, active, gender, phone });
    console.log(results)
    res.status(200).json({ message: results })
})
const getProfile = asyncWrapper(async (req, res, next)=>{
    const {username, email, gender, roleid, phone, clinicName} = await UserModel.getUserInfoWithoutPasswordById(req.user.userid)
    res.status(200).json({
        name:username, email, gender, roleid,phone, clinicName
    })
})

const activateUser = asyncWrapper(async (req,res,next)=>{
    const id = req.params.userId;
    const results = await UserModel.setActive(id);
    console.log(results)
    res.status(200).json({ message: results })
})
const deactivateUser = asyncWrapper(async (req,res,next)=>{
    const id = req.params.userId;
    const results = await UserModel.setInactive(id);
    console.log(results)
    res.status(200).json({ message: results })
})
const deleteUser = asyncWrapper(async (req,res,next)=>{
    const userId = req.params.userId;
    const results = await UserModel.deleteUser(userId);
    res.status(200).json({message: results})
})
const updateEmail = asyncWrapper(async (req,res,next)=>{
    const userId = req.user.userid;
    const {email, confirm_email} = req.body;
    if (email !== confirm_email) {
        return next(new BadRequestError('Email mismatched.'));
    }
    const results = await UserModel.updateEmail(userId,email);
    res.status(200).json({message: results})
})
const updatePassword = asyncWrapper(async (req,res,next)=>{
    const userId = req.user.userid;
    const {old_password,password, confirm_password} = req.body;
    const user = await UserModel.getUserInfoWithPasswordById(userId)
    const isPasswordValid = UserModel.verifyPassword(user,old_password)
    if (!isPasswordValid) {
        return next(new BadRequestError('Wrong Old Password'));
    }
    if (!password || password.length < 6) {
        return next(new BadRequestError('Password should at least have a length of 6.'));
    }
    if (password !== confirm_password) {
        return next(new BadRequestError('New Password mismatched.'));
    }
    const results = await UserModel.updateEmail(userId,password);
    res.status(200).json({message: results})
})
const updateBasic = asyncWrapper(async (req,res,next)=>{
    const userId = req.user.userid;
    const  {username, gender} = req.body;
    if(!username || (gender!=='Male' &&gender!=='Female')){
        return next(new BadRequestError(`Invalid Basic Information.`))
    }
    const results = await UserModel.updateBasic(userId,username, gender);
    res.status(200).json({message: results})
})
const updateSingleField = asyncWrapper(async (req,res,next)=>{
    const userId = req.user.userid;
    const  {field, value} = req.body;
    if(!field || !value){
        return next(new BadRequestError(`Invalid field value--${field}:${value}.`))
    }
    const results = await UserModel.updateBasic(userId,field, value);
    res.status(200).json({message: results})
})

module.exports = {
    deleteUser,
    getOrderList,
    getAccessibleCategories,
    grantUserAccess,
    forbiddenUserAccess,
    getDoctorCasesByTime,
    createTechnician,
    updateTechnician,
    getAccessDoctorRelation,
    getProfile,
    activateUser,
    deactivateUser,
    loadNotifications,
    readNotification,
    updateBasic,
    updateEmail,
    updatePassword,
    updateSingleField
}