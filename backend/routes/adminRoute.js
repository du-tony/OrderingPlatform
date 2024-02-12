const express = require('express');
const router = express.Router();
const adminController = require("../controllers/adminController")
const {authenticationMiddleware, adminAuthMiddleware} = require("../middleware/auth")
router.get('/deactivate/:userId', authenticationMiddleware, adminAuthMiddleware, adminController.deactivateUserId);
router.get('/activate/:userId', authenticationMiddleware, adminAuthMiddleware, adminController.activateUserId)
module.exports = router;
