const db = require("../../models/index");
const nodemailer = require('nodemailer');
const bcrypt = require("bcrypt");
const JWT = require('../../middleware/middleware'); // Middleware để tạo và xác thực JWT
require('dotenv').config();

// Hàm gửi email
const sendResetEmail = async (email, token) => {
    try {
        // Tạo một transporter để gửi email
        const transporter = nodemailer.createTransport({
            host: "smtp.gmail.com",
            port: 587,
            secure: false, // false cho cổng 587, true cho cổng 465 nếu dùng SSL
            auth: {
                user: process.env.EMAIL_USER, // Địa chỉ email của bạn
                pass: process.env.EMAIL_PASSWORD, // Mật khẩu ứng dụng hoặc mật khẩu email của bạn
            },
            tls: {
                rejectUnauthorized: false // Cho phép các kết nối không an toàn (tùy chọn)
            }
        });

        // Cấu hình các thông tin của email
        let mailOptions = {
            from: process.env.EMAIL_USER,
            to: email,
            subject: 'Password Reset',
            text: `Please use the following token to reset your password: ${token}`,
        };

        // Gửi email và chờ kết quả
        const info = await transporter.sendMail(mailOptions);
        console.log('Email sent: ' + info.response);

        return true; // Trả về true nếu gửi thành công
    } catch (error) {
        console.error('Error sending email:', error);
        return false; // Trả về false nếu gửi không thành công
    }
};

// Hàm xử lý yêu cầu quên mật khẩu
const forgotPassword = async (req, res) => {
    try {
        const { email } = req.body;
        const users = await db.User.findOne({ where: { email } });

        if (!users) {
            return res.status(404).json({ message: 'Email không tồn tại.' });
        }

        // Tạo token cho email
        const token = JWT.createJWT({ email }, { expiresIn: '1h' });

        // Gửi email xác nhận
        const emailSent = await sendResetEmail(email, token);
        if (emailSent) {
          console.log("OTP đã được gửi tới email của bạn.");
            // return res.status(200).json({ message: 'OTP đã được gửi tới email của bạn.' });
            return res.send(`
              <html>
                  <head>
                      <title>Thông Báo</title>
                  </head>
                  <body>
                      <div style="text-align: center; margin-top: 50px;">
                          <h3>OTP đã được gửi tới email của bạn.</h3>
                          <form action="/reset-password">
                              <button type="submit">OK</button>
                          </form>
                      </div>
                  </body>
              </html>
          `);
        } else {
            return res.status(500).json({ message: 'Lỗi khi gửi email.' });
        }
    } catch (error) {
        console.log(error);
        return res.status(500).json({ message: 'Lỗi hệ thống.' });
    }
};

// Hàm xử lý yêu cầu đặt lại mật khẩu
const resetPassword = async (req, res) => {
    try {
        const { token, newPassword } = req.body;
        const decoded = JWT.verifyToken(token);

        if (!decoded) {
            return res.status(400).json({ message: 'Token không hợp lệ hoặc đã hết hạn.' });
        }

        const user = await db.User.findOne({ where: { email: decoded.email } });
        if (!user) {
            return res.status(404).json({ message: 'Không tìm thấy người dùng.' });
        }

        // Cập nhật mật khẩu mới
        const hashedPassword = await bcrypt.hash(newPassword, 10);
        user.password = hashedPassword;
        await user.save();
console.log("Mật khẩu đã được cập nhật.");
        // return res.status(200).json({ message: 'Mật khẩu đã được cập nhật.' });
        return res.send(`
          <html>
              <head>
                  <title>Mật khẩu đã được cập nhật</title>
              </head>
              <body>
                  <div style="text-align: center; margin-top: 50px;">
                      <h3>Mật khẩu của bạn đã được cập nhật thành công.</h3>
                      <form action="/login">
                          <button type="submit">OK</button>
                      </form>
                  </div>
              </body>
          </html>
      `);
    } catch (error) {
        console.log(error);
        return res.status(500).json({ message: 'Lỗi hệ thống.' });
    }
};

// Xuất tất cả các hàm ra ngoài theo cấu trúc yêu cầu
module.exports = {
    forgotPassword,
    resetPassword,
};
