 const config = {
    user: 'debug',
    password: 'debug',
    server: 'localhost',
    database: 'CarShowroomDB',
    options: {
      encrypt: true
    }
  };

const sql = require('mssql');
const pool = new sql.ConnectionPool(config)
    .connect()
    .then(pool => pool)
    .catch(err => err);

module.exports = pool;