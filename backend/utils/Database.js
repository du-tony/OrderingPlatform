const pool = require('./pool');

class Database {
  // Function to execute a query
  static query(sql, params) {
    return new Promise((resolve, reject) => {
      pool.query(sql, params, (error, results) => {
        if (error) {
          reject(error);
        } else {
          resolve(results);
        }
      });
    });
  }

  // Additional methods for CRUD can be added here
}

module.exports = Database;
