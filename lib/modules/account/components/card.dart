import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:ready_or_not/modules/common/common.dart' as common;

class AccountCard extends Equatable {
  final int id;
  final String name;
  final Decimal amount;
  final bool enabled;
  final int createTime;
  final String memo;
  final String currencyName;
  final common.CurrencyType currencyType;

  // TODO: add chart

  AccountCard(
      {required this.id,
      required this.name,
      required this.amount,
      required this.currencyName,
      required this.currencyType,
      this.enabled = false,
      this.createTime = 0,
      this.memo = ''});

  @override
  List<Object> get props => [name, amount, enabled, createTime, memo, currencyName, currencyType];
}
