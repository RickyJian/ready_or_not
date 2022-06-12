import 'package:flutter/material.dart';
import 'package:ready_or_not/modules/bottom/components/button.dart';
import 'package:ready_or_not/modules/common/common.dart';

import 'constant.dart';

class BottomNavBar extends StatelessWidget {
  final List<BottomNavButton> items;
  final BottomNavItem currentIndex;
  final ValueChanged<BottomNavItem> onTapped;

  const BottomNavBar({required this.items, required this.currentIndex, required this.onTapped});

  @override
  Widget build(context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items.map(
          (item) {
            return TextButton(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(Constant.iconPadding),
                    child: Icon(
                      item.icon,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Constant.textPadding),
                    child: Text(
                      item.item.string,
                    ),
                  ),
                ],
              ),
              onPressed: () => onTapped(item.item),
            );
          },
        ).toList(),
      ),
    );
  }
}
