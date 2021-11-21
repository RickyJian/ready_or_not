import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';

class AccountInfo extends Equatable {
  final String name;
  final Decimal amount;

  AccountInfo({required this.name, required this.amount});

  AccountInfo.init({required this.name}) : amount = Decimal.zero;

  @override
  List<Object> get props => [name, amount];
}
