import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ready_or_not/modules/common/common.dart' as common;
import 'package:ready_or_not/modules/home/components/components.dart' as cpn;
import 'package:ready_or_not/modules/home/controller.dart';
import 'package:sizer/sizer.dart';

import 'constant.dart';

class Statistic extends StatelessWidget {
  final String name;
  final List<cpn.StatisticItem> items;

  final HomeController _homeController = Get.find();

  Statistic({required this.name, required this.items});

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
                                      onTap: () => _homeController.changeStatisticItem(item.item),
                                      child: GetX<HomeController>(
                                        init: _homeController,
                                        builder: (current) => Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: Constant.statisticItemHorizontalIconMargin.w,
                                          ),
                                          decoration: BoxDecoration(
                                            color: current.statisticItem.value == item.item
                                                ? common.Themes.lightPrimaryColor200
                                                : Colors.transparent,
                                            borderRadius: BorderRadius.circular(Constant.statisticItemIconBorderRadius),
                                          ),
                                          child: SizedBox(
                                            height: Constant.statisticItemIconHeight.h,
                                            width: Constant.statisticItemIconWidth.w,
                                            child: Icon(item.icon),
                                          ),
                                        ),
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
                      child: GetX<HomeController>(
                        init: _homeController,
                        builder: (current) {
                          switch (current.statisticItem.value) {
                            case common.StatisticItem.line:
                              return LineChartWidget();
                            case common.StatisticItem.bar:
                              return BarChartWidget();
                            case common.StatisticItem.pie:
                              return PieChartWidget();
                            case common.StatisticItem.calendar:
                              return Container();
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              // TODO:
              print('show information');
            },
            onLongPress: () {
              // TODO: direct to statistic page and query for accounts
              print('long press');
            },
          ),
        ),
      );
}

class LineChartWidget extends StatelessWidget {
  @override
  Widget build(context) => LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(spots: [
              FlSpot(0, 0),
              FlSpot(1, 1),
              FlSpot(2, 2),
              FlSpot(3, 3),
              FlSpot(4, 4),
              FlSpot(5, 5),
              FlSpot(6, 6),
              FlSpot(7, 7),
              FlSpot(8, 8),
              FlSpot(9, 9),
              FlSpot(10, 10),
            ]),
            LineChartBarData(spots: [
              FlSpot(0, 0),
              FlSpot(3, 2),
              FlSpot(4, 2),
              FlSpot(5, 4),
              FlSpot(6, 7),
              FlSpot(10, 10),
            ]),
          ],
        ),
        // swapAnimationDuration: Duration(milliseconds: 150), // Optional
        // swapAnimationCurve: Curves.linear, // Optional
      );
}

class BarChartWidget extends StatelessWidget {
  @override
  Widget build(context) => BarChart(
        BarChartData(
          barGroups: [
            BarChartGroupData(
              x: 1,
              barRods: [
                BarChartRodData(
                  toY: 5,
                ),
              ],
            ),
            BarChartGroupData(
              x: 2,
              barRods: [
                BarChartRodData(
                  toY: 10,
                ),
              ],
            ),
            BarChartGroupData(
              x: 3,
              barRods: [
                BarChartRodData(
                  toY: 7,
                ),
              ],
            ),
            BarChartGroupData(
              x: 4,
              barRods: [
                BarChartRodData(
                  toY: 3,
                ),
              ],
            ),
          ],
        ),
        // swapAnimationDuration: Duration(milliseconds: 150), // Optional
        // swapAnimationCurve: Curves.linear, // Optional
      );
}

class PieChartWidget extends StatelessWidget {
  @override
  Widget build(context) => Stack(
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
      );
}

class CalendarWidget extends StatelessWidget {
  @override
  Widget build(context) => throw UnimplementedError();
}
