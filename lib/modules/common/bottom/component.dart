import 'package:flutter/material.dart';

enum BottomNavItemIndex {
  home,
  account,
  transaction,
  setting,
}

// TODO: i18n
class BottomNavItem {
  final String name;
  final IconData icon;
  final BottomNavItemIndex index;

  BottomNavItem({required this.name, required this.icon, required this.index});

  @override
  String toString() => name;
}
