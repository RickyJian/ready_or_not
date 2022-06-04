import 'package:ready_or_not/modules/common/common.dart';

class Util {
  static CurrencyType convertToCurrencyType(int value) {
    switch (value) {
      case 0:
        return CurrencyType.normal;
      case 1:
        return CurrencyType.special;
      default:
        throw const MetaException("unhandled type");
    }
  }
}
