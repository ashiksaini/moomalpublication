import 'package:payu_checkoutpro_flutter/PayUConstantKeys.dart'
    show PayUHashConstantsKeys;
import 'package:crypto/crypto.dart';
import 'dart:convert';

class HashService {
  HashService._();

  static const merchantSalt =
      "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDBdG1aOKb+3MUR4mGUKfZr/t67Y3O+Vc1u8bh8DFfthdtUwGcHWwDLTeUbglh1qzahYQf8cU7yiWm9OTCje4EaxG35QGtXtrlt/klavmuAnYAS5ll/jED6UYbzY1L3RhN2XMYpWpnVhTaKsSTJnAKKxEa/1/Hb+tMnLbW5qGQ0LpmzVuB4VAafjuBqEmGIRUgXCfmat2Ezeznp+Vs/R/+B8wA38VYuqVIP7BfFj/TPwV+xQzkZ2mNHPScFRWocfOJOWlYKnlcV0A/GkkIWQo7p+sF7MNDxab5ZGrXW71Xk1KmwKUF0+xFUz6OHoA/TU1VrLbuKF0eHozXfVxLSL/y9AgMBAAECggEAEK2K5+ZOb1Z1Hu+XXgCoH/NfHGSci+I1zcTFFNyzj+SkXhAgUcAEt4JFqDN6kNpr4UnOOHNETSCPnyKZEN8K6FXa7UwidPNp1RPBGzOjbPknG3oEaTycNXhl3AHKG0tNTjz9UH9hF8leRGK1OzRZ+8CkINHrJf3fylbkfdcInH7pmAE8NCwKzcNr4ewk9G4AVHydUsSl07WtngDKrMDosarCfxwlxun2WLvMAabqfyR3+U1zEE7UDtzh7aWNWkAOBOYuSFMK3ne/VM91Y1x2a7sMl9MF7XJorgvrFbjJ3aXizy7Nw6vGWWIbMRSqXKvoOXwLEaLURWS6YLl+KRrCwQKBgQDmmINDZ6I48Tp6ENgCvG2XkZyYBgRU9j3z7F5fi8U1Tp9lFw5BSaFg334HUhg0FdejFN5ROgUU4yuAyTf1Wyz40UoMkfVgnsVDC7cBVadQla3RsrBJYTuY90dcrNXBTEkXSjbmnqkAX+XqKRHksD4g4PXOivVCWLZyygTLFyQ0RQKBgQDWxG2/b9V2mr7kyt0VRyHfWW8cjonhLcQOF8ahjjHNEwAMIwhgbFZzvYSYUImZH3QnGWJxQ7Nl4BWZy7U88UbWgX6y1sDsP0iFS+cGRALsCb6mQFGCYGiW/5ElExab015VABuiZ7Hw0y6Rn87OMQaqX28Wg83t+YE1BEpyYqZ6GQKBgCLKoANrf25X9xqzr+O5yk80CQxm3AB1pqNG5nZEAF0qn6IA+IWhNlgHYFx6Zmx1XzOb0m8u8dVU8RtdQLQkLYTdDu8Wlo8dZWXYPqRU6Amgi7k33KE1qmhJ5tp0uUuQ1vZMnDvvdFA6J9ZMnAaFENqlFnEzRg3clKp9EHwT4cKBAoGBAIBGwuZc/brhorM1F+flnK2y1VLRMDl3BGsGeHV2YPiEKLsXEaHGE7z9rXzsXcM/rjjMSKguL7DhrwU1TwMfeZgVsH9RFdoF0mMLeumbJcOl7mGOeSDORKor652hURexn95VOiw+k2GsQVxpfzRYxApvBgMEprNFG493CKBZm+XBAoGAQH3LGiXHeSASJLrZDzf5k520zOadO0oCk1M7xckmUSFUFndRi8YLEolSdO3Z56G9YoU7bflnU90Iz0n7EqUg9UhnOuQQpgzPz4SoohifgDjg43Exd95FpGAUQVIrmFg0a3OKZ6+DfbIW7gTaKaP3huHRX5QLOlngXIgSFwh3xrU="; // Add you Salt here.
  static const merchantSecretKey = ""; // Add Merchant Secrete Key - Optional

  static Map generateHash(Map response) {
    var hashName = response[PayUHashConstantsKeys.hashName];
    var hashStringWithoutSalt = response[PayUHashConstantsKeys.hashString];
    var hashType = response[PayUHashConstantsKeys.hashType];
    var postSalt = response[PayUHashConstantsKeys.postSalt];
    var hash = "";
    if (hashType == PayUHashConstantsKeys.hashVersionV2) {
      hash = getHmacSHA256Hash(hashStringWithoutSalt, merchantSalt);
    } else if (hashName == PayUHashConstantsKeys.mcpLookup) {
      hash = getHmacSHA1Hash(hashStringWithoutSalt, merchantSecretKey);
    } else {
      var hashDataWithSalt = hashStringWithoutSalt + merchantSalt;
      if (postSalt != null) {
        hashDataWithSalt = hashDataWithSalt + postSalt;
      }
      hash = getSHA512Hash(hashDataWithSalt);
    }
    var finalHash = {hashName: hash};
    return finalHash;
  }

  static String getSHA512Hash(String hashData) {
    var bytes = utf8.encode(hashData);
    var hash = sha512.convert(bytes);
    return hash.toString();
  }

  static String getHmacSHA256Hash(String hashData, String salt) {
    var key = utf8.encode(salt);
    var bytes = utf8.encode(hashData);
    final hmacSha256 = Hmac(sha256, key).convert(bytes).bytes;
    final hmacBase64 = base64Encode(hmacSha256);
    return hmacBase64;
  }

  static String getHmacSHA1Hash(String hashData, String salt) {
    var key = utf8.encode(salt);
    var bytes = utf8.encode(hashData);
    var hmacSha1 = Hmac(sha1, key); // HMAC-SHA1
    var hash = hmacSha1.convert(bytes);
    return hash.toString();
  }
}
