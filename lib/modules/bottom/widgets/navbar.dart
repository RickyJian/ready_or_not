import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ready_or_not/modules/bottom/bottom.dart';
import 'package:ready_or_not/modules/common/common.dart' as common;

import 'constant.dart';

class BottomNavBar extends StatelessWidget {
  final BottomController _bottomController = Get.find();
  final List<BottomNavButton> items;

  BottomNavBar({required this.items});

  @override
  Widget build(context) => BottomAppBar(
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
                onPressed: () => _bottomController.changeNavItem(item.item),
              );
            },
          ).toList(),
        ),
      );
}
