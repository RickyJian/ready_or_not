import 'package:flutter/material.dart';
import 'package:ready_or_not/modules/common/common.dart' as common;
import 'package:sizer/sizer.dart';

import 'constant.dart';

class StatisticCard extends StatelessWidget {
  @override
  Widget build(context) => Padding(
        padding: EdgeInsets.only(
          top: Constant.statisticCardPaddingTop.h,
          left: Constant.statisticCardPaddingHorizontal.w,
          right: Constant.statisticCardPaddingHorizontal.w,
          bottom: Constant.statisticCardPaddingBottom.h,
        ),
        child: SizedBox(
          height: Constant.statisticCardHeight.h,
          width: Constant.statisticCardWidth.w,
          child: GestureDetector(
            child: Card(
              elevation: common.Constant.cardElevation,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(common.Constant.cardBorderRadius),
              ),
              child: Container(),
            ),
            onTap: () {
              // TODO:
              print('go to detail page');
            },
            onLongPress: () {
              // TODO: direct to statistic page and query for accounts
              print('long press');
            },
          ),
        ),
      );
}

class TxCard extends StatelessWidget {
  @override
  Widget build(context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
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
