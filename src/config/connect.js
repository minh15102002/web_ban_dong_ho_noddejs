const { Sequelize } = require("sequelize");

// const sequelize = new Sequelize("db_ban_dong_ho", "root", null, {
//   host: "localhost",
//   dialect: "mysql",
// });
const sequelize = new Sequelize(process.env.MYSQL_DATABASE || "railway", 
  process.env.MYSQL_USER || "root", 
  process.env.MYSQL_ROOT_PASSWORD || "PXzNkzlUrFIoRSpTkNOeIZeVXXlBixjR", 
  {
host: "mysql.railway.internal",  // Địa chỉ host của Railway
dialect: "mysql",
port: process.env.MYSQL_PORT || 3306,
});
const connection = async () => {
  try {
    await sequelize.authenticate();
    console.log("Connection has been established successfully.");
  } catch (error) {
    console.error("Unable to connect to the database:", error);
  }
};
module.exports = connection;
