import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';

enum CurrencyType { basic, special }

class Currency extends Equatable {
  final String name;
  final CurrencyType type;
  final Decimal exchangeRate;

  Currency({required this.name, required this.type, required this.exchangeRate});

  @override
  List<Object> get props => [name, type, exchangeRate];
}
