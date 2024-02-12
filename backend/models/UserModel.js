const { BadRequestError } = require('../errors');
const Database = require('../utils/Database');
const { sha1 } = require("../utils/utilities")
const bcrypt = require('bcryptjs');
class UserModel {
  static async findUserByEmail(email) {
    const sql = 'SELECT * FROM users WHERE email = ?';
    const results = await Database.query(sql, [email]);
    if (results.length > 0) {
      return results[0];
    } else {
      return null;
    }
  }
  static verifyPassword(user, password) {
    if (user && user.password && user.passwordSalt && user.passwordSalt != null && user.passwordSalt !== '') {
      const salt = user.passwordSalt;
      const cryptedPassword = sha1(password + salt);
      if (cryptedPassword !== user.password) {
        return false;
      } else{
        return true;
      }
    } else if (user && user.password) {
      const isPasswordValid = bcrypt.compareSync(old_password, user.password);
      return isPasswordValid;
    }
    return false;
  }
  static async createUser(userData) {
    const sql = 'INSERT INTO users (active, username, email, password,  roleid,  clinicName, phone, gender) VALUES (?,?, ?, ?, ?, ?,  ?, ?)';
    const params = [userData.active, userData.username, userData.email, userData.password, userData.roleid, userData.clinicName, userData.phone, userData.gender];
    const user = await Database.query(sql, params);
    return user.insertId;
  }
  static async setActive(userId) {
    const sql = 'UPDATE users SET active = 1 WHERE id = ?';
    await Database.query(sql, [userId]);
  }
  static async setInactive(userId) {
    const sql = 'UPDATE users SET active = 0 WHERE id = ?';
    await Database.query(sql, [userId]);
  }
  static async getAllUsers() {
    const sql = 'SELECT u.id, u.username,u.email,u.active,r.rolename as role,r.roleid as roleid,u.gender,u.clinicName as clinic,u.phone,CONCAT(date(u.createDate),\'-\',time(u.createDate)) as time From `users` u, `role` r WHERE r.roleid=u.roleid order by id asc;';
    const results = await Database.query(sql);
    return results;
  }
  static async getUserInfoWithoutPasswordById(userId) {
    const sql = 'SELECT id as userId, username, email, active, roleid, gender, phone, clinicName FROM `users` WHERE id = ?';
    const technician = await Database.query(sql, [userId]);
    if (technician.length === 0) {
      return null;
    } else {
      return technician[0];
    }
  }
  static async getUserInfoWithPasswordById(userId) {
    const sql = 'SELECT * FROM `users` WHERE id = ?';
    const user = await Database.query(sql, [userId]);
    if (user.length === 0) {
      return null;
    } else {
      return user[0];
    }
  }
  static async updateTechnician({ id, username, email, password, roleid, active, gender, phone }) {
    let results;
    if (password != null && password != '' && password != undefined) {
      const sql = 'UPDATE `users` SET `username` = ? , `email` = ? , `password` = ? ,`passwordSalt` = \'\' , `roleid`=?, `active`=?,`gender` = ? ,`phone` = ? where id =?';
      results = await Database.query(sql, [username, email, bcrypt.hashSync(password), roleid, active, gender, phone, id])
    } else {
      const sql = 'UPDATE `users` SET `username` = ? , `email` = ? , `roleid`=?, `active`=?,`gender` = ? ,`phone` = ? where id =?';
      results = await Database.query(sql, [username, email, roleid, active, gender, phone, id])
    }
    return results;
  }

  static async deleteUser(userId) {
    const results = await Database.query('DELETE FROM `users` WHERE `users`.`id` = ?;', [userId])
    console.log(results)
    return results;
  }

  static async updateEmail(id, email) {
    const results = await Database.query('UPDATE `users` SET `email` = ? WHERE `users`.`id` = ?;', [email, id])
    return results
  }
  static async updateBasic(id, username, gender) {
    const results = await Database.query('UPDATE `users` SET `username` = ?, `gender`=? WHERE `users`.`id` = ?;'[username, gender, id]);
    return results
  }
  static async updateField(id, field, value) {
    const results = await Database.query('UPDATE `users` SET `' + field + '` = ? WHERE `users`.`id` = ?;', [value, id]);
    return results
  }
  static async updatePassword(id, password) {
    const cryptedPassword = bcrypt.hashSync(password);
    const results = await Database.query('UPDATE `users` SET `password` = ?, `passwordSalt` = \'\' WHERE `users`.`id` = ?;',[cryptedPassword, id])
    return results
  }
}

module.exports = UserModel;
