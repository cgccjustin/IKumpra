const nodemailer = require('nodemailer');
const config = require('../config/env');

// Create transporter
const createTransporter = () => {
  return nodemailer.createTransporter({
    host: config.EMAIL_HOST,
    port: config.EMAIL_PORT,
    secure: false, // true for 465, false for other ports
    auth: {
      user: config.EMAIL_USER,
      pass: config.EMAIL_PASS
    }
  });
};

// Send password reset email
const sendPasswordResetEmail = async (email, resetToken) => {
  const transporter = createTransporter();
  
  const resetUrl = `${config.CORS_ORIGIN.split(',')[0]}/reset-password?token=${resetToken}`;
  
  const mailOptions = {
    from: `"IKumpra" <${config.EMAIL_USER}>`,
    to: email,
    subject: 'Password Reset Request',
    html: `
      <div style="font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto;">
        <h2 style="color: #2c3e50;">Password Reset Request</h2>
        <p>You requested a password reset for your IKumpra account.</p>
        <p>Click the button below to reset your password:</p>
        <a href="${resetUrl}" 
           style="display: inline-block; background-color: #3498db; color: white; padding: 12px 24px; text-decoration: none; border-radius: 5px; margin: 20px 0;">
          Reset Password
        </a>
        <p>If the button doesn't work, copy and paste this link into your browser:</p>
        <p style="word-break: break-all; color: #7f8c8d;">${resetUrl}</p>
        <p>This link will expire in 10 minutes.</p>
        <p>If you didn't request this, please ignore this email.</p>
        <hr style="margin: 30px 0;">
        <p style="color: #7f8c8d; font-size: 12px;">
          This email was sent from IKumpra. Please do not reply to this email.
        </p>
      </div>
    `
  };

  try {
    await transporter.sendMail(mailOptions);
    return true;
  } catch (error) {
    console.error('Email send error:', error);
    return false;
  }
};

// Send order confirmation email
const sendOrderConfirmation = async (email, orderData) => {
  const transporter = createTransporter();
  
  const mailOptions = {
    from: `"IKumpra" <${config.EMAIL_USER}>`,
    to: email,
    subject: `Order Confirmation - ${orderData.orderNumber}`,
    html: `
      <div style="font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto;">
        <h2 style="color: #2c3e50;">Order Confirmation</h2>
        <p>Thank you for your order!</p>
        <div style="background-color: #f8f9fa; padding: 20px; border-radius: 5px; margin: 20px 0;">
          <h3>Order Details</h3>
          <p><strong>Order Number:</strong> ${orderData.orderNumber}</p>
          <p><strong>Total Amount:</strong> ₱${orderData.totalAmount.toFixed(2)}</p>
          <p><strong>Status:</strong> ${orderData.status}</p>
        </div>
        <p>We'll notify you when your order is ready for delivery.</p>
        <hr style="margin: 30px 0;">
        <p style="color: #7f8c8d; font-size: 12px;">
          This email was sent from IKumpra. Please do not reply to this email.
        </p>
      </div>
    `
  };

  try {
    await transporter.sendMail(mailOptions);
    return true;
  } catch (error) {
    console.error('Email send error:', error);
    return false;
  }
};

module.exports = {
  sendPasswordResetEmail,
  sendOrderConfirmation
}; 