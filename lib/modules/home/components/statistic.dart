import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ready_or_not/modules/common/common.dart' as common;

class StatisticItem extends Equatable {
  final common.StatisticItem item;
  final IconData icon;

  const StatisticItem({required this.item, required this.icon});

  @override
  List<Object?> get props => [item];
}
