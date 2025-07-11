const express = require('express');
const router = express.Router();
const {
  getUserProfile,
  updateUserProfile,
  changePassword,
  getAllUsers,
  updateUser,
  deleteUser
} = require('../controllers/userController');
const { protect, admin } = require('../middleware/auth');

// Customer routes
router.use(protect);

router.get('/profile', getUserProfile);
router.put('/profile', updateUserProfile);
router.put('/change-password', changePassword);

// Admin routes
router.get('/admin/all', admin, getAllUsers);
router.put('/admin/:id', admin, updateUser);
router.delete('/admin/:id', admin, deleteUser);

module.exports = router; 