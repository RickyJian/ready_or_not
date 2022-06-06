import 'package:flutter/material.dart';
import 'package:ready_or_not/modules/account/components/components.dart';
import 'package:ready_or_not/modules/common/common.dart' as common;
import 'package:sizer/sizer.dart';

import 'constant.dart';

class AccountInfo extends StatelessWidget {
  final List<AccountInfoComponent> infos;

  const AccountInfo({required this.infos});

  @override
  Widget build(context) {
    return Row(
      children: infos
          .asMap()
          .entries
          .map((entry) {
            var info = entry.value;
            return [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      info.type.string,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: Constant.infoTextSize.sp,
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(vertical: Constant.infoPadding.h),
                      child: Text(
                        info.amount.toDouble().abs().toString(),
                        style: TextStyle(
                          // TODO: dark mode
                          color: info.amount.isNegative
                              ? common.Themes.lightNegativeColor
                              : common.Themes.lightPositiveColor,
                          fontSize: Constant.infoMoneyTextSize.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              entry.key != infos.length - 1
                  ? Container(
                      width: Constant.infoDividerWidth,
                      height: Constant.infoDividerHeight.h,
                      color: common.Themes.lightPrimaryColor.withOpacity(0.6),
                    )
                  : Container(),
            ];
          })
          .map((widgets) => Expanded(child: Row(children: widgets)))
          .toList(),
    );
  }
}
