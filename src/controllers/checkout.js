const stripe = require('stripe')(process.env.STRIPE_SECRET_KEY);
const axios = require('axios');

const createCheckoutSession = async (req, res) => {
  console.log('User Info:', {
    name: req.body.name,
    phone: req.body.phone,
    address: req.body.address,
});
req.session.userName = req.body.name;
  req.session.userPhone = req.body.phone;
  req.session.userAddress = req.body.address;

  try {
    if (!req.session.cart || req.session.cart.length === 0) {
      req.flash("error", "Giỏ hàng của bạn trống, vui lòng thêm sản phẩm!");
      return res.redirect("/cart");
    }
    const session = await stripe.checkout.sessions.create({
      payment_method_types: ['card'],
      line_items: req.session.cart.map((item) => ({
        price_data: {
          currency: 'vnd',
          product_data: {
            name: item.name,
          },
          unit_amount: item.price * 1, // Price in cents
        },
        quantity: item.quantity,
      })),
      mode: 'payment',
      
      success_url: `${process.env.BASE_URL2}complete?session_id={CHECKOUT_SESSION_ID}`,
      // success_url: `${process.env.BASE_URL2}complete`,
    //   cancel_url: `${process.env.BASE_URL2}cart`,

    cancel_url: req.session.previousUrl || `${process.env.BASE_URL2}cart`, // Quay lại trang trước đó
    });
    
    res.redirect(session.url);
  } catch (error) {
    console.error('Stripe Error:', error);
    res.status(500).send('Error creating checkout session');
  }
};



const handlePaymentSuccess = async (req, res) => {
    const sessionId = req.query.session_id;
    console.log('Session ID:', sessionId);
    if (!sessionId) {
      return res.status(400).send('Session ID is required');
    }
  
    try {
      const session = await stripe.checkout.sessions.retrieve(sessionId, {
        expand: ['payment_intent'],
      });

      // Kiểm tra trạng thái thanh toán
      if (session.payment_status === 'paid') {
        const totalAmount = session.amount_total / 1;
        // Tạo dữ liệu đơn hàng
        if (!req.session.cart || req.session.cart.length === 0) {
          req.flash('error', 'Giỏ hàng của bạn trống, không thể tạo đơn hàng!');
          return res.redirect('/cart');
      }
        const dataOrder = {
          user: {
            name: req.body.name || req.session.userName, // Thông tin từ session hoặc form
            phone: req.body.phone || req.session.userPhone,
            address: req.body.address || req.session.userAddress,
            UserId: req.session.UserId || req.body.UserId || req.cookies.UserId, // ID người dùng trong session
            status: 1,
            total: totalAmount,
          },
          cart: req.session.cart,
        };
  
        // Gọi hàm order để gửi thông tin lên server
        const orderResponse = await axios.post(process.env.BASE_URL + 'order', dataOrder);
  
        if (orderResponse.data.success) {
          // Dọn sạch giỏ hàng sau khi tạo đơn hàng thành công
          req.session.cart = null;
          req.flash('success', orderResponse.data.message);
          return res.render('checkout/complete.ejs', { session });
        } else {
          req.flash('error', 'Failed to create order');
          return res.redirect('/cart');
        }
      } else {
        return res.status(400).send('Payment not successful');
      }
    } catch (error) {
      console.error('Error retrieving payment session:', error);
      return res.status(500).send('Error retrieving payment session');
    }
  };
  

module.exports = {
  createCheckoutSession,
  handlePaymentSuccess,
};
