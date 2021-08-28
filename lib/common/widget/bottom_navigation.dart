import 'package:flutter/material.dart';

import 'const.dart';

class BottomNavigationBar extends StatelessWidget {
  final BottomNavItem currentIndex;
  final List<BottomNavigationItem> items;
  final ValueChanged<BottomNavItem> onTapped;

  BottomNavigationBar({required this.currentIndex, required this.items, required this.onTapped});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items.map((item) {
          var color = Colors.grey;
          if (currentIndex == item.name) {
            color = Colors.blue;
          }
          return TextButton(
            onPressed: () => onTapped(item.name),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(
                    item.icon,
                    color: color,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    item.toString(),
                    style: TextStyle(color: color),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

class BottomNavigationItem {
  final IconData icon;
  final BottomNavItem name;

  const BottomNavigationItem({required this.icon, required this.name});

  @override
  String toString() {
    switch (name) {
      case BottomNavItem.unspecified:
        return "";
      case BottomNavItem.home:
        return "home";
      case BottomNavItem.account:
        return "account";
      case BottomNavItem.transaction:
        return "chart";
      case BottomNavItem.setting:
        return "setting";
    }
  }
}
