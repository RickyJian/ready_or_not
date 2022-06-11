import 'package:flutter/material.dart';

import 'component.dart';

class BottomNavBar extends StatelessWidget {
  final BottomNavItemIndex currentIndex;
  final List<BottomNavItem> items;
  final ValueChanged<BottomNavItemIndex> onTapped;

  BottomNavBar({required this.currentIndex, required this.items, required this.onTapped});

  @override
  Widget build(BuildContext context) => BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items
              .map(
                (item) => TextButton(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          item.icon,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          item.toString(),
                        ),
                      ),
                    ],
                  ),
                  onPressed: () => onTapped(item.index),
                ),
              )
              .toList(),
        ),
      );
}
