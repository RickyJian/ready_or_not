import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ready_or_not/modules/account/components/components.dart';
import 'package:ready_or_not/modules/account/controller.dart';
import 'package:ready_or_not/modules/account/widgets/widgets.dart' as wdg;
import 'package:ready_or_not/modules/common/common.dart' as common;
import 'package:sizer/sizer.dart';

import 'constant.dart';

class AccountListPage extends StatelessWidget {
  final AccountController accountController = Get.find();

  @override
  Widget build(context) => Sizer(
        builder: (context, orientation, deviceType) => NestedScrollView(
          controller: accountController.scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(
                    height: Constant.accountInfoHeight.h,
                    child: GetX<AccountController>(
                      init: accountController,
                      builder: (account) => wdg.AccountInfo(
                        infos: [
                          AccountInfoComponent(
                            type: common.AccountInfoType.assets,
                            amount: account.assets.value,
                            onTapped: () => account.count(common.AccountInfoType.assets),
                          ),
                          AccountInfoComponent(
                            type: common.AccountInfoType.liabilities,
                            amount: account.liabilities.value,
                            onTapped: () => account.count(common.AccountInfoType.liabilities),
                          ),
                          AccountInfoComponent(
                            type: common.AccountInfoType.netAssets,
                            amount: account.netAssets.value,
                            onTapped: () => account.count(common.AccountInfoType.netAssets),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          body: Container(
            height: Constant.accountListHeight.h,
            width: Constant.accountListWidth.w,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                common.Panel().getBoxShadow(),
              ],
            ),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                GetX<AccountController>(
                  init: accountController,
                  builder: (account) => wdg.AccountCardInfo(
                    info: AccountCardInfoComponent(
                      total: account.accountCardListTotal.value,
                      enabled: account.accountCardListEnabled.value,
                      onChanged: (enabled) => account.filterCards(enabled),
                    ),
                  ),
                ),
                GetX<AccountController>(
                  init: accountController,
                  builder: (account) => SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => AnimatedBuilder(
                        animation: account.formAnimationController,
                        builder: (context, child) => FadeTransition(
                          opacity: account.formAnimation,
                          child: Transform.translate(
                            offset:
                                Offset(0, common.GlobalUI().getScreenHeight() * (1.0 - account.formAnimation.value)),
                            child: wdg.AccountCard(
                              account: account.cards[index],
                            ),
                          ),
                        ),
                      ),
                      childCount: account.cards.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
