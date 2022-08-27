import 'package:flutter/material.dart';
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
                StatisticCard(),
                TxCard(),
              ],
            ),
            DashboardPanel(),
          ],
        ),
      );
}
