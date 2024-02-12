const express = require('express');
const router = express.Router();
const dashBoardController = require("../controllers/dashBoardController")
const {authenticationMiddleware, adminAuthMiddleware} = require("../middleware/auth")
const {validateUserData,validateUserId,validateUserEmail} = require('../middleware/validateUserData')

//get all orders based on the role/ get orders within time range
router.route('/orders')
    .get(authenticationMiddleware, dashBoardController.getOrderList)
    .post(authenticationMiddleware,adminAuthMiddleware, dashBoardController.getDoctorCasesByTime);

//load accessible categories/grant access/limit access
router.route('/category')
    .get(authenticationMiddleware, dashBoardController.getAccessibleCategories)
    .post(authenticationMiddleware, adminAuthMiddleware, dashBoardController.grantUserAccess)
    .delete(authenticationMiddleware, adminAuthMiddleware, dashBoardController.forbiddenUserAccess);
    
router.post('/createTechnician',authenticationMiddleware, adminAuthMiddleware,validateUserData, dashBoardController.createTechnician);
router.post('/updateTechnician/:userId',authenticationMiddleware, adminAuthMiddleware,validateUserId,validateUserEmail, dashBoardController.updateTechnician);
router.get('/activate/:userId',authenticationMiddleware, adminAuthMiddleware,validateUserId, dashBoardController.activateUser);
router.get('/deactivate/:userId',authenticationMiddleware, adminAuthMiddleware,validateUserId, dashBoardController.deactivateUser);
router.delete('/deleteUser/:userId',authenticationMiddleware, adminAuthMiddleware,validateUserId, dashBoardController.deleteUser)
//the doctor access table, actually get all users information, including admin/technicians/admin
router.get('/getDoctorAccessRelation', authenticationMiddleware, adminAuthMiddleware, dashBoardController.getAccessDoctorRelation)

router.get('/profile', authenticationMiddleware, dashBoardController.getProfile)

router.post('/updateEmail',authenticationMiddleware,validateUserEmail,dashBoardController.updateEmail);
router.post('/updatePassword/',authenticationMiddleware, dashBoardController.updatePassword);
router.post('/update/',authenticationMiddleware, dashBoardController.updateSingleField);
router.post('/updateBasic/',authenticationMiddleware,dashBoardController.updateBasic)

module.exports = router;
