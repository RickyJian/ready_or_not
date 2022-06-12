import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ready_or_not/modules/common/common.dart';

class BottomNavButton extends Equatable {
  final BottomNavItem item;
  final IconData icon;

  const BottomNavButton({required this.item, required this.icon});

  @override
  List<Object?> get props => [item];
}
