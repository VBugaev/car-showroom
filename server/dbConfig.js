 const config = {
    user: 'debug',
    password: 'debug',
    server: '127.0.0.1',
    port: 1703,
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