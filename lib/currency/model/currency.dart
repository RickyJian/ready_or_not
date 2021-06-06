import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

enum CurrencyType { basic, special }

class Currency extends Equatable {
  final String name;
  final CurrencyType type;
  final Decimal exchangeRate;

  const Currency({@required this.name, @required this.type, this.exchangeRate});

  @override
  List<Object> get props => [name, type, exchangeRate];
}
