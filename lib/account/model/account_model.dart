import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:ready_or_not/currency/model/currency.dart';

class Account extends Equatable {
  final String name;
  final Decimal amount;
  final bool enabled;
  final int createTime;
  final String memo;
  final String currencyName;
  final CurrencyType currencyType;

  // TODO: add chart

  Account.card(
      {required this.name,
      required this.amount,
      required this.currencyName,
      required this.currencyType,
      this.enabled = false,
      this.createTime = 0,
      this.memo = ''});

  Account.fromMap(Map<String, dynamic> objectMap)
      : name = objectMap['name'],
        amount = objectMap['amount'],
        enabled = objectMap['enabled'],
        createTime = objectMap['createTime'],
        currencyName = objectMap['Currencies_name'],
        currencyType = objectMap['Currencies_type'],
        memo = objectMap['memo'];

  @override
  List<Object> get props => [name, amount, enabled, createTime, memo, currencyName, currencyType];
}

class AccountInfo extends Equatable {
  final Decimal assets;
  final Decimal liability;
  final Decimal netAssets;

  const AccountInfo({required this.assets, required this.liability, required this.netAssets});

  @override
  List<Object> get props => [assets, liability, netAssets];
}
