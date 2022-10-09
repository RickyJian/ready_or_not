import 'package:flutter/material.dart';
import 'package:ready_or_not/modules/common/common.dart' as common;
import 'package:sizer/sizer.dart';

import 'constant.dart';

class Transaction extends StatelessWidget {
  @override
  Widget build(context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: Constant.txCardHeight.h,
            width: Constant.txCardWidth.w,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(common.Constant.cardBorderRadius),
              ),
              elevation: common.Constant.cardElevation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Icon(Icons.directions_bus),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text('Traffic'),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: Constant.txCardHeight.h,
            width: Constant.txCardWidth.w,
            child: Card(
              elevation: common.Constant.cardElevation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Icon(Icons.fastfood),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text('Fastfood'),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: Constant.txDividerWidth,
            height: Constant.txDividerHeight.h,
            color: common.Themes.lightPrimaryColor.withOpacity(0.6),
          ),
          SizedBox(
            height: Constant.txCardHeight.h,
            width: Constant.txCardWidth.w,
            child: Card(
              elevation: common.Constant.cardElevation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Icon(Icons.attach_money),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text('Salary'),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: Constant.txCardHeight.h,
            width: Constant.txCardWidth.w,
            child: Card(
              elevation: common.Constant.cardElevation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(flex: 2, child: Icon(Icons.sell)),
                  Expanded(
                    flex: 1,
                    child: Text('Sell'),
                  )
                ],
              ),
            ),
          ),
        ],
      );
}
