const Database = require('../utils/Database');

class LogModel {
  static async addCaseLog(order_id, event) {
    const sql = 'INSERT INTO `case_log` (`order_id`,`event`) VALUES ( ?, ?);';
    const results = await Database.query(sql, [order_id, event]);
    return results.insertId;
  }
}

module.exports = {LogModel};
