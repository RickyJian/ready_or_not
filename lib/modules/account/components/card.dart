import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ready_or_not/modules/common/common.dart' as common;

class AccountCardInfoComponent extends Equatable {
  final int total;
  final bool enabled;

  final ValueChanged<bool> onChanged;

  const AccountCardInfoComponent({required this.total, required this.enabled, required this.onChanged});

  @override
  List<Object> get props => [total, enabled];
}

class AccountCardComponent extends Equatable {
  final int id;
  final String name;
  final Decimal amount;
  final common.CurrencyType type;
  final String unit;
  final bool enabled;
  final int createTime;
  final String memo;

  // TODO: add chart

  const AccountCardComponent(
      {required this.id,
      required this.name,
      required this.amount,
      required this.type,
      required this.unit,
      required this.enabled,
      required this.createTime,
      this.memo = ''});

  @override
  List<Object> get props => [id];
}
