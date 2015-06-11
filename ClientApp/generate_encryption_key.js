var CryptoJS = require("crypto-js");

wordArray = CryptoJS.lib.WordArray.random(32);
console.log("bytes key: [" + wordArray.words + "]");

bytes_stringify_b64 = CryptoJS.enc.Base64.stringify(wordArray);
console.log("Base64 key: " + bytes_stringify_b64);
