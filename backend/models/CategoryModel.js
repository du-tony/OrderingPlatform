const Database = require('../utils/Database');

class CategoryModel {
  static async getAllCategories() {
    const sql = 'SELECT id, name from category order by id asc;';          
    const results = await Database.query(sql);
    return results;
  }
  static async getAllDoctorAccess(){
    const sql = 'SELECT da.doctor_id as id,da.category_id as category_id From `doctor_access` da;'
    const results = await Database.query(sql);
    return results;
  }
  static async getAccessibleCategoriesByUserId(userId) {
    const sql = 'SELECT c.name,c.description, c.buttonText,c.categoryUrl, da.id as toShow from category c LEFT JOIN doctor_access da on c.id = da.category_id AND da.doctor_id=?;';
    const results = await Database.query(sql, [userId]);
    return results;
  }

  static async getUserAccessibilities() {
    const sql = 'SELECT doctor_id as id,category_id From `doctor_access`;';          
    const results = await Database.query(sql);
    return results;
  }
  static async grantUserAccess(doctor_id, category_id){
    const sql = 'INSERT IGNORE INTO `doctor_access` ( `doctor_id`, `category_id`) VALUES ( ?, ?);';
    const params = [doctor_id, category_id];
    const result = await Database.query(sql, params);
    return result;
  }
  static async forbiddenUserAccess(doctor_id, category_id){
    const sql = 'DELETE FROM `doctor_access` WHERE `doctor_id` = ?  and `category_id` = ?';
    const params = [doctor_id, category_id];
    const result = await Database.query(sql, params);
    return result;
  }
}

module.exports = CategoryModel;
