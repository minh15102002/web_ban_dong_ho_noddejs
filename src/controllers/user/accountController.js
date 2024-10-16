const db = require("../../models/index");

const indexAccount = async (req, res) => {
    try {
      // Giả sử thông tin người dùng đang đăng nhập được lưu trong session
      const userId = req.body.UserId || req.session.UserId || req.cookies.UserId; // Hoặc lấy từ cookie hoặc một phương thức khác bạn đã triển khai
  
      // Kiểm tra xem người dùng có đang đăng nhập hay không
      if (!userId) {
        return res.status(401).json({
          success: false,
          message: "Bạn cần đăng nhập để xem thông tin tài khoản!",
        });
      }
  
      // Lấy thông tin người dùng theo ID
      const user = await db.User.findOne({
        where: {
          id: userId,
        },
      });
  
      // Kiểm tra xem người dùng có tồn tại hay không
      if (!user) {
        return res.status(404).json({
          success: false,
          message: "Tài khoản không tồn tại!",
        });
      }
  
      // Nếu yêu cầu là từ API, trả về JSON
      if (req.headers['accept'] === 'application/json') {
        return res.status(200).json({
          success: true,
          user: {
            id: user.id,
            name: user.name,
            email: user.email,
            // Thêm các thông tin khác nếu cần thiết
          },
        });
      }
  
      // Nếu không, render trang account.ejs
      return res.render("user/account.ejs", {
        user: {
          id: user.id,
          name: user.name,
          email: user.email,
        },
      });
  
    } catch (error) {
      console.log(error);
      return res.status(500).json({
        success: false,
        message: "Đã xảy ra lỗi khi lấy thông tin tài khoản!",
      });
    }
  };
  
  



const updateAccount = async (req, res) => {
    try {
      const user_id = req.params.user_id; // Lấy ID người dùng từ params
      const user = await db.User.findOne({
        where: {
          id: user_id, // Tìm người dùng theo ID
        },
      });
  
      // Kiểm tra xem người dùng có tồn tại hay không
      if (!user) {
        return res.status(404).json({
          detail: "Không tồn tại người dùng!",
        });
      }
  
      // Lấy thông tin mới từ request body
      const { name, email } = req.body; // Lấy name và email từ form
  
      // Kiểm tra xem có trường nào không được gửi hay không
      if (!name && !email) {
        return res.status(400).json({
          detail: "Vui lòng cung cấp ít nhất một trong hai trường name hoặc email để cập nhật!",
        });
      }
  
      // Cập nhật thông tin người dùng
      await db.User.update(
        {
          name: name || user.name, // Nếu không có name mới, giữ nguyên
          email: email || user.email, // Nếu không có email mới, giữ nguyên
        },
        {
          where: {
            id: user_id, // Cập nhật theo ID người dùng
          },
        }
      );
  
      return res.status(200).json({
        success: true,
        message: "Cập nhật thông tin người dùng thành công!",
      });
    } catch (error) {
      console.log(error);
      return res.status(500).json({
        success: false,
        message: "Đã xảy ra lỗi khi cập nhật thông tin!",
      });
    }
  };
  



module.exports = {
    indexAccount,
    updateAccount,
};
