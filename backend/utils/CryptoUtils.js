const crypto = require('crypto');
const BadRequest = require('../errors/bad-request');
require('dotenv').config();

class CryptoUtils {
  static encrypt(text) {
    // const key = crypto.randomBytes(32);
    // console.log(key.toString('hex'));
    const iv = crypto.randomBytes(16);
    const encryptionKey = Buffer.from(process.env.ENCRYPTION_KEY, 'hex');

    // Check if the encryption key is 32 bytes long
    if (encryptionKey.length !== 32) {
      throw new Error('Encryption key must be 32 bytes long.');
    }
    const cipher = crypto.createCipheriv('aes-256-cbc', encryptionKey, iv);
    let encrypted = cipher.update(text, 'utf8', 'hex');
    encrypted += cipher.final('hex');
    const encryptedText = iv.toString('hex') + ':' + encrypted;
    return encryptedText;
  }

  static decrypt(encryptedText) {
    const textParts = encryptedText.split(':');
    const iv = Buffer.from(textParts.shift(), 'hex');
    const encryptedMessage = Buffer.from(textParts.join(':'), 'hex');
    const decryptionKey = Buffer.from(process.env.ENCRYPTION_KEY, 'hex');

    // Check if the decryption key is 32 bytes long
    if (decryptionKey.length !== 32) {
      throw new BadRequest('Decryption key must be 32 bytes long.');
    }

    // Create a decipher
    const decipher = crypto.createDecipheriv('aes-256-cbc', decryptionKey, iv);
    let decrypted = decipher.update(encryptedMessage, 'hex', 'utf8');
    decrypted += decipher.final('utf8');
    console.log(decrypted)
    return decrypted;
  }
}

module.exports = CryptoUtils;
