const express = require('express');
const router = express.Router();
const authController = require('../controllers/authController');
const {validateUserData} = require('../middleware/validateUserData') 
router.post('/signup', validateUserData,authController.signup);
router.post('/signin', authController.signin);
router.get('/signout', authController.signout);
router.get('/activate/:encrypted', authController.activateEncryptedUserId )
module.exports = router;
