import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:ready_or_not/currency/model/currency.dart';

class Account extends Equatable {
  final String name;
  final Decimal amount;
  final bool enabled;
  final Currency currency;
  final String memo;

  // TODO: add chart

  const Account({@required this.name, @required this.amount, @required this.currency, this.enabled, this.memo});

  Decimal total() {
    return amount * currency.exchangeRate;
  }

  @override
  List<Object> get props => [name, amount, enabled, currency, memo];
}
