import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:ready_or_not/currency/model/currency.dart';

enum AccountType { basic, special }

class Account extends Equatable {
  final String name;
  final AccountType type;
  final Decimal initValue;
  final Currency currency;
  final bool enabled;
  final String memo;

  Account(
      {this.name,
      this.type,
      this.initValue,
      this.currency,
      this.enabled,
      this.memo});

  @override
  List<Object> get props => [name, type, initValue, currency, enabled, memo];
}
