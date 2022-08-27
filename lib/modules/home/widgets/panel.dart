import 'package:flutter/material.dart';
import 'package:ready_or_not/modules/common/common.dart' as common;
import 'package:sizer/sizer.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'constant.dart';

class DashboardPanel extends StatelessWidget {
  @override
  Widget build(context) => SlidingUpPanel(
        maxHeight: Constant.slideUpPanelMaxHeight.h,
        minHeight: Constant.slideUpPanelMinHeight.h,
        boxShadow: [
          common.Panel().getBoxShadow(),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(common.Constant.cardBorderRadius),
          topRight: Radius.circular(common.Constant.cardBorderRadius),
        ),
        panel: Center(
          child: Text("This is the sliding Widget"),
        ),
      );
}
