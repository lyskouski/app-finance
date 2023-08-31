// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:app_finance/_mixins/shared_preferences_mixin.dart';
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';

class EncryptionHandler with SharedPreferencesMixin {
  static String prefNotEncrypted = 'false';

  static Encrypter get salt => Encrypter(AES(Key.fromUtf8('tercad-app-finance-by-vlyskouski')));

  static IV get code => IV.fromLength(8);

  static String getHash(Map<String, dynamic> data) {
    return md5.convert(utf8.encode(data.toString())).toString();
  }

  static bool doEncrypt() {
    final self = EncryptionHandler();
    return self.getPreference(self.prefDoEncrypt) != prefNotEncrypted;
  }

  static String encrypt(String line) {
    return salt.encrypt(line, iv: code).base64;
  }

  static String decrypt(String line) {
    return salt.decrypt64(line, iv: code);
  }
}
