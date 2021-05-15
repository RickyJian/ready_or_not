import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Currency extends Equatable {
  final String name;
  final Decimal exchangeRate;

  Currency(
    this.name, [
    this.exchangeRate,
  ]);

  @override
  List<Object> get props => [name, exchangeRate];
}
