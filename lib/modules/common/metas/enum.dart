import 'package:get/get.dart';
import 'package:ready_or_not/modules/common/i18n/message.dart';

/// Enum stores all enum

/// CurrencyType defines currency type
enum CurrencyType { normal, special }

extension CurrencyTypeExtension on CurrencyType {
  String get string {
    switch (this) {
      case CurrencyType.normal:
        return Message.currencyTypeNormal.tr;
      case CurrencyType.special:
        return Message.currencyTypeSpecial.tr;
    }
  }

  int get index {
    switch (this) {
      case CurrencyType.normal:
        return 0;
      case CurrencyType.special:
        return 1;
    }
  }
}

/// Account
enum AccountInfoType { assets, liabilities, netAssets }

extension ToString on AccountInfoType {
  String get string {
    switch (this) {
      case AccountInfoType.assets:
        return Message.accountListInfoAssets.tr;
      case AccountInfoType.liabilities:
        return Message.accountListInfoLiabilities.tr;
      case AccountInfoType.netAssets:
        return Message.accountListInfoNetAssets.tr;
    }
  }
}
