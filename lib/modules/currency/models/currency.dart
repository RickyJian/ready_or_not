import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:ready_or_not/modules/common/common.dart' as common;

class Currency extends Equatable {
  final String name;
  final common.CurrencyType type;
  final Decimal exchangeRate;

  const Currency({required this.name, required this.type, required this.exchangeRate});

  @override
  List<Object> get props => [name, type];
}
