const Database = require('../utils/Database');
const {sortById} = require('../utils/utilities')
class AddresssModel {
  static async getUserAddressesByUserId(userId) {
    const sql = `
      SELECT a.id AS addressId, a.detailAddress AS address 
      FROM address a
      JOIN customeraddress ca ON ca.address_id = a.id AND ca.customer_id = ?;
    `;
    const results = await Database.query(sql, [userId]);
    return results;
  }
  static async updateAddress(addressId, address) {
    const sql = 'UPDATE `address` SET `detailAddress` = ? WHERE `address`.`id` = ?;';
    const results = await Database.query(sql, [address, addressId]);
    console.log(results)

  }
  static async getAdminAddress() {
    const sql = 'SELECT a.detailAddress as address FROM `address` a, `customeraddress` ca, `users` u WHERE ca.customer_id=u.id and a.id=ca.address_id and (u.roleid=1 or u.roleid=2);';
    const results = await Database.query(sql)
    return results
  }
  static async deleteAddress(addressId) {
    await Database.query(
      'DELETE FROM `customeraddress` WHERE `address_id` = ?;', 
      [addressId]
    );
    await Database.query(
      'DELETE FROM `address` WHERE `id` = ?;', 
      [addressId]
    );

  }
}

module.exports = AddresssModel;
