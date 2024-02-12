const nodemailer = require('nodemailer');
require('dotenv').config();

class EmailService {
  static async sendEmail(userInfo, link) {
    const transporter = nodemailer.createTransport({
      service: 'gmail', // Use Gmail's service
      auth: {
        user: process.env.ADMIN_EMAIL, // Your email user
        pass: process.env.ADMIN_EMAIL_TOKEN, // Your email password
      },
    });

    const mailOptions = {
      from: userInfo.email,
      to: process.env.ADMIN_EMAIL,
      subject: 'Premiumhklab New Registeration',
      text: 'new sign up and require activation',
      html: '<p>New user want to sign up:</p><br>' +
      '<p>name:' + userInfo.username + '</p><br>' +
      '<p>gender:' + userInfo.gender + '</p><br>' +
      '<p>email:' + userInfo.email + '</p><br>' +
      '<p>clinic name:' + userInfo.clinicName + '</p><br>' +
      '<p>address:' + userInfo.userInfoaddress + '</p><br>' +
      '<p>phone:' + userInfo.phone + '</p><br>' +
      '<p>to activate:' + link + '</p><br>',
};

    try {
      const info = await transporter.sendMail(mailOptions);
      console.log('Email sent: ' + info.response);
    } catch (error) {
      console.error('Error sending email:', error);
    }
  }
}

module.exports = EmailService;

