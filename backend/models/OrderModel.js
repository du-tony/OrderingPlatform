const Database = require('../utils/Database');

class OrderModel {
  static async getAllOrderList() {
    const sql = 'SELECT distinct o.id as order_id,pi.remarks,  c.name as category,c.id as classId, c.description as description,c.categoryUrl, o.patient_id,pi.patient_name,pi.patient_image_path,o.order_status, e.event as status, o.customer_id as doctor_id,u.username as doctor_name,o.draft_time, (SELECT COUNT(*) FROM `chatrooms` cr WHERE cr.orderId = o.id and unread =1 and fromId =o.customer_id) as unread_cnt,(SELECT COUNT(*) FROM `case_log` cl WHERE cl.order_id = o.id and cl.unread =1 ) as unread_notification_cnt FROM `order` o, `patient_info` pi,`category` c,`users` u,`event` e  WHERE pi.id=o.patient_id AND o.category_id=c.id and u.id=o.customer_id and e.id=o.order_status and e.id <> 0;';          
    const results = await Database.query(sql);
    return results;
    
  }
  static async getOrderListByUserId(userId) {
    const sql = 'SELECT distinct o.id as order_id, c.name as category,c.id as classId,c.description as description,c.categoryUrl, o.patient_id,pi.patient_name,pi.remarks,pi.patient_image_path,o.order_status, e.event as status, o.customer_id as doctor_id,u.username as doctor_name,o.draft_time, (SELECT COUNT(*) FROM `chatrooms` cr WHERE cr.orderId = o.id and unread =1 and fromId <> ?) as unread_cnt FROM `order` o, `patient_info` pi,`category` c,`users` u,`event` e WHERE pi.id=o.patient_id AND o.category_id=c.id and u.id=o.customer_id and e.id=o.order_status and o.customer_id=?';
    const results = await Database.query(sql, [userId, userId]);
    return results;
  }
  static async getDoctorCasesByTime(doctor_id, begin_date, end_date){
    const sql = 'SELECT o.id as OrderId, c.name as Category, e.event as Status,CONCAT(date( o.draft_time),\'-\',time( o.draft_time)) as Time FROM `order` o, `event` e, `category` c where c.id=o.category_id AND e.id=o.order_status and e.id>0 and draft_time<=STR_TO_DATE(?,\'%Y-%m-%dT%H:%i:%s.%f\') and draft_time>=STR_TO_DATE(?,\'%Y-%m-%dT%H:%i:%s.%f\') and o.customer_id=?;';
    const results = await Database.query(sql, [end_date,begin_date, doctor_id]);
    return results;
  } 
}

module.exports = OrderModel;
