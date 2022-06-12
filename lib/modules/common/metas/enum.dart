import 'package:get/get.dart';
import 'package:ready_or_not/modules/common/i18n/message.dart';

/// Enum stores all enum

/// BottomNavItem defines bottom item
enum BottomNavItem {
  home,
  account,
  statistic,
  setting,
}

extension BottomItemExtension on BottomNavItem {
  String get string {
    switch (this) {
      case BottomNavItem.home:
        return Message.bottomNavItemHome.tr;
      case BottomNavItem.account:
        return Message.bottomNavItemAccount.tr;
      case BottomNavItem.statistic:
        return Message.bottomNavItemStatistic.tr;
      case BottomNavItem.setting:
        return Message.bottomNavItemSetting.tr;
    }
  }

  int get index {
    switch (this) {
      case BottomNavItem.home:
        return 0;
      case BottomNavItem.account:
        return 1;
      case BottomNavItem.statistic:
        return 2;
      case BottomNavItem.setting:
        return 3;
    }
  }
}

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

/// AccountInfoType
enum AccountInfoType { assets, liabilities, netAssets }

extension AccountInfoTypeExtension on AccountInfoType {
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
