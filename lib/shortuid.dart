library shortuid;

import 'package:shortuid/helpers.dart';
import 'package:uuid/uuid.dart';

class ShortUid {
  static const stringBase =
      '23456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz';

  static String create() {
    var uuidv4 = Uuid().v4();
    return ShortUid.from_uid(uuidv4);
  }

  static String from_uid(String uuidv4, {String toAlpha = stringBase}) {
    var fromHex = Helper(srcAlpha: Helper.HEX, dstAlpha: toAlpha);
    return fromHex.convert(uuidv4.toLowerCase().replaceAll(RegExp(r'-'), ''));
  }

  static String decode_to_uid(String shortuid, {String toAlpha = stringBase}) {
    var toHex = Helper(srcAlpha: toAlpha, dstAlpha: Helper.HEX);

    String strUid = toHex.convert(shortuid);

    var leftPad = '';

    var m = <String>[];

    for (var i = 0, len = 32 - strUid.length; i < len; ++i) {
      leftPad += '0';
    }

    var exp = RegExp(r'(\w{8})(\w{4})(\w{4})(\w{4})(\w{12})');

    Iterable<Match> matches = exp.allMatches(leftPad + strUid);

    if (matches.isNotEmpty) {
      var match = matches.first;

      for (var i = 1; i <= match.groupCount; i++) {
        var matchStr = match.group(i);
        m.add(matchStr!);
      }
    }
    return [m[0], m[1], m[2], m[3], m[4]].join('-');
  }
}
