import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ready_or_not/modules/common/common.dart' as common;
import 'package:ready_or_not/modules/home/components/components.dart' as cpn;
import 'package:sizer/sizer.dart';

import 'constant.dart';

class Statistic extends StatelessWidget {
  final String name;
  final List<cpn.StatisticItem> items;

  const Statistic({required this.name, required this.items});

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: Constant.statisticItemHorizontalPadding.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(left: Constant.statisticAccountLeftMargin.w),
                              child: Text(
                                name,
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  fontSize: Constant.statisticAccountFontSize.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: items
                                  .map(
                                    (item) => GestureDetector(
                                      onTap: item.onPressed,
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal: Constant.statisticItemHorizontalMargin.w,
                                        ),
                                        child: item.icon,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(
                      margin: EdgeInsets.only(
                        top: Constant.statisticChartTopMargin.h,
                        bottom: Constant.statisticChartBottomMargin.h,
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            child: Text(
                              'Some informations',
                            ),
                          ),
                          PieChart(
                            PieChartData(
                              startDegreeOffset: 270,
                              sections: [
                                PieChartSectionData(
                                  color: common.Themes.lightPositiveColor,
                                  value: 60,
                                  radius: Constant.statisticPieChartRadius.w,
                                  showTitle: false,
                                ),
                                PieChartSectionData(
                                  color: common.Themes.lightNegativeColor,
                                  value: 30,
                                  radius: Constant.statisticPieChartRadius.w,
                                  showTitle: false,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
