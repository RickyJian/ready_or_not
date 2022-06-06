import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:ready_or_not/modules/common/common.dart';

class AccountInfoComponent extends Equatable {
  final AccountInfoType type;
  final Decimal amount;

  const AccountInfoComponent({required this.type, required this.amount});

  @override
  List<Object> get props => [type, amount];
}
