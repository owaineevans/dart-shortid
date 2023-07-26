class Helper {
  static const BIN = '01';
  static const OCT = '01234567';
  static const DEC = '0123456789';
  static const HEX = '0123456789abcdef';

  String srcAlpha;
  String dstAlpha;

  Helper({
    this.srcAlpha = Helper.DEC,
    this.dstAlpha = Helper.HEX,
  }) {
    if ((srcAlpha.isEmpty) || (dstAlpha.isEmpty)) {
      throw Exception('Invalid srcAlpha or dstAlpha');
    }
    this.srcAlpha = srcAlpha;
    this.dstAlpha = dstAlpha;
  }

  bool isValid(dynamic number) {
    var i = 0;
    for (; i < number.length; ++i) {
      if (!srcAlpha.contains(number[i])) {
        return false;
      }
    }
    return true;
  }

  dynamic convert(dynamic number) {
    number = number.toString();
    var i,
        divide,
        newlen,
        numberMap = {},
        fromBase = srcAlpha.length,
        toBase = dstAlpha.length,
        length = number.length,
        result = number.runtimeType == String ? '' : [];

    if (!isValid(number)) {
      throw Exception('Number "' +
          number +
          '" contains non-alphabetic digits (' +
          srcAlpha +
          ')');
    }

    if (srcAlpha == dstAlpha) {
      return number;
    }

    for (i = 0; i < length; i++) {
      numberMap[i] = srcAlpha.indexOf(number[i]);
    }
    do {
      divide = 0;
      newlen = 0;
      for (i = 0; i < length; i++) {
        divide = divide * fromBase + numberMap[i];
        if (divide >= toBase) {
          numberMap[newlen++] = (divide / toBase).toInt();
          divide = divide % toBase;
        } else if (newlen > 0) {
          numberMap[newlen++] = 0;
        }
      }
      length = newlen;
      result = dstAlpha.substring(divide, divide + 1) + result.toString();
    } while (newlen != 0);

    return result;
  }
}
