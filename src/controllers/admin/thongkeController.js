const { User, Order, Product, Order_Product, sequelize } = require('../../models');

const getthongke = async (req, res) => {
  let customerCount, orderCount, quantitySold, revenueData, revenue; // Khai báo biến ở đây

  try {
    // Count customers
    customerCount = await User.count();
    console.log('Customer Count:', customerCount);

    // Count total orders
    orderCount = await Order.count();
    console.log('Order Count:', orderCount);

    // Sum of products sold (quantity sold)
    quantitySold = await Order_Product.sum('quantity');
    console.log('Quantity Sold:', quantitySold);

    // Calculate revenue by joining with Product and multiplying price by quantity
    revenueData = await Order_Product.findAll({
      include: [
        {
          model: Product,
          attributes: ['price']
        }
      ],
      attributes: ['quantity']
    });
    console.log('Revenue Data:', revenueData);

    // Calculate total revenue
    revenue = revenueData.reduce((total, orderProduct) => {
      return total + orderProduct.quantity * orderProduct.Product.price;
    }, 0);
    console.log('Total Revenue:', revenue);

    // Pass the summary data to the EJS view
    res.render('admin/thong_ke.ejs', {
      summary: {
        customer_count: customerCount,
        order_count: orderCount,
        quantity_sold: quantitySold,
        revenue: revenue.toFixed(2),
      },
      chartData: {
        salesByCategory: [30, 25, 20, 15, 10],  // Placeholder for actual data
        ordersPerMonth: [50, 70, 80, 40, 100, 90, 60],  // Placeholder for actual data
      }
    });
  } catch (error) {
    console.error('Error fetching dashboard data:', error);
    res.status(500).send('Server error: ' + error.message);
  }
};

module.exports = {
  getthongke
};