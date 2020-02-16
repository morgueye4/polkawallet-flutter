import 'dart:math';

import 'package:intl/intl.dart';

class Fmt {
  static String address(String addr, {int pad = 8}) {
    if (addr == null || addr.length == 0) {
      return addr;
    }
    return addr.substring(0, pad) + '...' + addr.substring(addr.length - pad);
  }

  static String balance(String raw, {int decimals = 12}) {
    if (raw == null || raw.length == 0) {
      return raw;
    }
    NumberFormat f = NumberFormat(",##0.000");
    var num = f.parse(raw);
    return f.format(num / pow(10, decimals));
  }

  static int balanceInt(String raw) {
    if (raw == null || raw.length == 0) {
      return 0;
    }
    return NumberFormat(",##0.000").parse(raw).toInt();
  }

  static String token(int value, {int decimals = 12, bool fullLength = false}) {
    NumberFormat f = NumberFormat(
        ",##0.${fullLength == true ? '000#########' : '000'}", "en_US");
    return f.format(value / pow(10, decimals));
  }

  static bool isAddress(String txt) {
    var reg = RegExp(r'^[A-z\d]{47}$');
    return reg.hasMatch(txt);
  }

  static bool checkPassword(String pass) {
    var reg = RegExp(r'^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$');
    return reg.hasMatch(pass);
  }
}
