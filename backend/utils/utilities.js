const sortById = (a, b)=> {
    return a.id - b.id;
}
//old account keeps old hash algorithm
const rotateLeft = (lValue, iShiftBits)=> {
    return (lValue << iShiftBits) | (lValue >>> (32 - iShiftBits));
  }
  const lsbHex = (value)=> {
    let string = '';
    let i;
    let vh;
    let vl;
    for (i = 0; i <= 6; i += 2) {
      vh = (value >>> (i * 4 + 4)) & 0x0f;
      vl = (value >>> (i * 4)) & 0x0f;
      string += vh.toString(16) + vl.toString(16);
    }
    return string;
  };
  
  const cvtHex = (value)=> {
    let string = '';
    let i;
    let v;
    for (i = 7; i >= 0; i--) {
      v = (value >>> (i * 4)) & 0x0f;
      string += v.toString(16);
    }
    return string;
  };
  
  const uTF8Encode = (string)=> {
    string = string.replace(/\x0d\x0a/g, '\x0a');
    let output = '';
    for (let n = 0; n < string.length; n++) {
      const c = string.charCodeAt(n);
      if (c < 128) {
        output += String.fromCharCode(c);
      } else if ((c > 127) && (c < 2048)) {
        output += String.fromCharCode((c >> 6) | 192);
        output += String.fromCharCode((c & 63) | 128);
      } else {
        output += String.fromCharCode((c >> 12) | 224);
        output += String.fromCharCode(((c >> 6) & 63) | 128);
        output += String.fromCharCode((c & 63) | 128);
      }
    }
    return output;
  };
  
  const sha1 = (string)=> {
    let blockstart;
    let i; let j;
    const W = new Array(80);
    let H0 = 0x67452301;
    let H1 = 0xEFCDAB89;
    let H2 = 0x98BADCFE;
    let H3 = 0x10325476;
    let H4 = 0xC3D2E1F0;
    let A; let B; let C; let D; let E;
    let tempValue;
    string = uTF8Encode(string);
    const stringLength = string.length;
    const wordArray = [];
    for (i = 0; i < stringLength - 3; i += 4) {
      j = string.charCodeAt(i) << 24 | string.charCodeAt(i + 1) << 16 | string.charCodeAt(i + 2) << 8 | string.charCodeAt(i + 3);
      wordArray.push(j);
    }
    switch (stringLength % 4) {
      case 0:
        i = 0x080000000;
        break;
      case 1:
        i = string.charCodeAt(stringLength - 1) << 24 | 0x0800000;
        break;
      case 2:
        i = string.charCodeAt(stringLength - 2) << 24 | string.charCodeAt(stringLength - 1) << 16 | 0x08000;
        break;
      case 3:
        i = string.charCodeAt(stringLength - 3) << 24 | string.charCodeAt(stringLength - 2) << 16 | string.charCodeAt(stringLength - 1) << 8 | 0x80;
        break;
    }
    wordArray.push(i);
    while ((wordArray.length % 16) != 14) wordArray.push(0);
    wordArray.push(stringLength >>> 29);
    wordArray.push((stringLength << 3) & 0x0ffffffff);
    for (blockstart = 0; blockstart < wordArray.length; blockstart += 16) {
      for (i = 0; i < 16; i++) W[i] = wordArray[blockstart + i];
      for (i = 16; i <= 79; i++) W[i] = rotateLeft(W[i - 3] ^ W[i - 8] ^ W[i - 14] ^ W[i - 16], 1);
      A = H0;
      B = H1;
      C = H2;
      D = H3;
      E = H4;
      for (i = 0; i <= 19; i++) {
        tempValue = (rotateLeft(A, 5) + ((B & C) | (~B & D)) + E + W[i] + 0x5A827999) & 0x0ffffffff;
        E = D;
        D = C;
        C = rotateLeft(B, 30);
        B = A;
        A = tempValue;
      }
      for (i = 20; i <= 39; i++) {
        tempValue = (rotateLeft(A, 5) + (B ^ C ^ D) + E + W[i] + 0x6ED9EBA1) & 0x0ffffffff;
        E = D;
        D = C;
        C = rotateLeft(B, 30);
        B = A;
        A = tempValue;
      }
      for (i = 40; i <= 59; i++) {
        tempValue = (rotateLeft(A, 5) + ((B & C) | (B & D) | (C & D)) + E + W[i] + 0x8F1BBCDC) & 0x0ffffffff;
        E = D;
        D = C;
        C = rotateLeft(B, 30);
        B = A;
        A = tempValue;
      }
      for (i = 60; i <= 79; i++) {
        tempValue = (rotateLeft(A, 5) + (B ^ C ^ D) + E + W[i] + 0xCA62C1D6) & 0x0ffffffff;
        E = D;
        D = C;
        C = rotateLeft(B, 30);
        B = A;
        A = tempValue;
      }
      H0 = (H0 + A) & 0x0ffffffff;
      H1 = (H1 + B) & 0x0ffffffff;
      H2 = (H2 + C) & 0x0ffffffff;
      H3 = (H3 + D) & 0x0ffffffff;
      H4 = (H4 + E) & 0x0ffffffff;
    }
    const finalValue = cvtHex(H0) + cvtHex(H1) + cvtHex(H2) + cvtHex(H3) + cvtHex(H4);
    return finalValue.toUpperCase();
  }
module.exports={
    sortById, sha1, uTF8Encode, cvtHex, lsbHex, rotateLeft
}