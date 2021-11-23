import 'package:decimal/decimal.dart';

import 'models/models.dart';

class CurrencyController {
  List<Currency> listCurrencies([bool onlyEnabled = false]) {
    return [
      Currency(name: 'USD', type: CurrencyType.basic, exchangeRate: Decimal.parse('1.00')),
      Currency(name: 'TWD', type: CurrencyType.basic, exchangeRate: Decimal.parse('27.80')),
      Currency(name: 'JPY', type: CurrencyType.basic, exchangeRate: Decimal.parse('115.06')),
      Currency(name: 'Points', type: CurrencyType.special, exchangeRate: Decimal.one),
    ];
  }
}
