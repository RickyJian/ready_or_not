import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ready_or_not/modules/common/common.dart' as common;
import 'package:ready_or_not/modules/home/components/components.dart' as cpn;
import 'package:ready_or_not/modules/home/widgets/widgets.dart';
import 'package:sizer/sizer.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(context) => Sizer(
        builder: (context, orientation, deviceType) => Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Statistic(
                  name: common.Message.homeStatisticDefaultAccount.tr,
                  items: const [
                    cpn.StatisticItem(icon: Icons.show_chart, item: common.StatisticItem.line),
                    cpn.StatisticItem(icon: Icons.bar_chart, item: common.StatisticItem.bar),
                    cpn.StatisticItem(icon: Icons.pie_chart, item: common.StatisticItem.pie),
                    cpn.StatisticItem(icon: Icons.calendar_month, item: common.StatisticItem.calendar),
                  ],
                ),
                Transaction(),
              ],
            ),
            DashboardPanel(),
          ],
        ),
      );
}
