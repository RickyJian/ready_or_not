import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ready_or_not/modules/account/account.dart';
import 'package:ready_or_not/modules/common/common.dart';
import 'package:ready_or_not/modules/home/views/home.dart';
import 'package:ready_or_not/modules/setting/views/setting.dart';
import 'package:ready_or_not/modules/statistic/views/statistic.dart';

class BottomNavigator extends StatelessWidget {
  final AccountController accountController = Get.find();
  final BottomNavItem item;

  BottomNavigator({required this.item});

  @override
  Widget build(context) => Navigator(
        key: Get.nestedKey(item.id),
        initialRoute: AppPath.account,
        onGenerateRoute: (path) {
          switch (item.id) {
            case AppPath.home:
              return GetPageRoute(
                routeName: AppPath.home,
                page: () => HomePage(),
              );
            case AppPath.account:
              // TODO: add reload function
              accountController.formAnimationController.reset();
              accountController.formAnimationController.forward();
              return GetPageRoute(
                routeName: AppPath.account,
                page: () => AccountListPage(),
              );
            case AppPath.statistic:
              return GetPageRoute(
                routeName: AppPath.statistic,
                page: () => StatisticPage(),
              );
            case AppPath.setting:
              return GetPageRoute(
                routeName: AppPath.setting,
                page: () => SettingPage(),
              );
            default:
              // TODO: throw path not found
              return null;
          }
        },
      );
}
