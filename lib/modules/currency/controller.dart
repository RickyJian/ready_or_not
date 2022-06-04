import 'package:decimal/decimal.dart';
import 'package:ready_or_not/modules/common/common.dart' as common;

import 'models/models.dart';

class CurrencyController {
  List<Currency> listCurrencyDropdownItems({required common.CurrencyType type, bool onlyEnabled = false}) {
    if (type == common.CurrencyType.normal) {
      return [
        Currency(name: 'USD', type: common.CurrencyType.normal, exchangeRate: Decimal.parse('1.00')),
        Currency(name: 'TWD', type: common.CurrencyType.normal, exchangeRate: Decimal.parse('27.80')),
        Currency(name: 'JPY', type: common.CurrencyType.normal, exchangeRate: Decimal.parse('115.06')),
      ];
    }
    return [
      Currency(name: 'Points', type: common.CurrencyType.special, exchangeRate: Decimal.one),
    ];
  }
}
