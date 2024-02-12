const Database = require('../utils/Database');
class NotificationModel {
  static async loadNotification() {
    const results = await Database.query('SELECT c.id as id, u.username as username,c.doctor_id as doctor_id, c.notification as notification, c.unread as unread, CONCAT(date(c.create_time),\'-\',time(c.create_time)) as time  FROM `doctor_info_change` c, `users` u WHERE c.doctor_id=u.id order BY unread, time  ASC;')
    return results;
  }
  static async readNotification(id) {
    const results = await Database.query('UPDATE `doctor_info_change` SET `unread` = \'0\' WHERE `doctor_info_change`.`id` = ?;',[id]);
    return results;
  }
}

module.exports = NotificationModel;
