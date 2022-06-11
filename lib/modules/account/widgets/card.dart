import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ready_or_not/modules/account/components/components.dart';
import 'package:ready_or_not/modules/common/common.dart' as common;
import 'package:sizer/sizer.dart';

import 'constant.dart';

class AccountCardInfo extends StatelessWidget {
  final AccountCardInfoComponent info;

  const AccountCardInfo({required this.info});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(
        '${common.Message.accountCardInfoTotal.tr} ${info.total}',
        style: TextStyle(
          fontSize: Constant.formTextSize.sp,
        ),
      ),
      elevation: 0,
      pinned: true,
      actions: [
        Row(
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                common.Message.accountCardInfoEnabled.tr,
                style: TextStyle(
                  // TODO: color from context
                  color: common.Themes.lightTextColor,
                  fontSize: Constant.formTextSize.sp,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Switch(
                value: info.enabled,
                onChanged: info.onChanged,
              ),
            ),
          ],
        )
      ],
      backgroundColor: Colors.white,
    );
  }
}

// TODO: disabled card color
class AccountCard extends StatelessWidget {
  final AccountCardComponent account;

  const AccountCard({required this.account});

  @override
  Widget build(context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Constant.cardPaddingHorizontal.w,
        vertical: Constant.cardPaddingVertical.h,
      ),
      child: SizedBox(
        height: Constant.cardHeight.h,
        width: Constant.cardWidth.w,
        child: GestureDetector(
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Constant.cardBorderRadius),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 2,
                  // TODO: change to chart
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(255, 242, 218, 1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Constant.cardBorderRadius),
                        topRight: Radius.circular(Constant.cardBorderRadius),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(Constant.cardBorderRadius),
                            ),
                          ),
                          child: Icon(
                            account.type == common.CurrencyType.normal
                                ? Icons.monetization_on_outlined
                                : Icons.cloud_queue_outlined,
                            size: Constant.cardIconSize.sp,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              account.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Constant.cardAccountPrimaryText.sp,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: Constant.cardAccountCenterTopPadding.h,
                                right: Constant.cardAccountCenterRightPadding.w,
                              ),
                              child: Text(
                                account.memo,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  // TODO: color from context
                                  color: common.Themes.lightTextSecondaryColor,
                                  fontSize: Constant.cardAccountSecondaryText.sp,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(Constant.cardBorderRadius),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  right: 5.w,
                                ),
                                child: Text(
                                  account.amount.abs().toDouble().toString(),
                                  style: TextStyle(
                                    // TODO: color from context
                                    color: account.amount.isNegative
                                        ? common.Themes.lightNegativeColor
                                        : common.Themes.lightPositiveColor,
                                    fontSize: Constant.cardAccountPrimaryText.sp,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: Constant.cardAccountRightTopPadding.h,
                                  right: Constant.cardAccountRightRightPadding.w,
                                ),
                                child: Text(
                                  account.unit,
                                  style: TextStyle(
                                    // TODO: color from context
                                    color: common.Themes.lightTextSecondaryColor,
                                    fontSize: Constant.cardAccountSecondaryText.sp,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            // TODO: go to detail page
            print('go to detail page');
          },
        ),
      ),
    );
  }
}
