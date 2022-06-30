import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ready_or_not/modules/account/components/components.dart';
import 'package:ready_or_not/modules/account/controller.dart';
import 'package:ready_or_not/modules/account/widgets/widgets.dart' as wdg;
import 'package:ready_or_not/modules/common/common.dart' as common;
import 'package:sizer/sizer.dart';

import 'constant.dart';

class AccountListPage extends StatelessWidget {
  final AccountController accountController;

  const AccountListPage({required this.accountController});

  @override
  Widget build(context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return NestedScrollView(
          controller: accountController.scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
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
            ];
          },
          body: Container(
            height: Constant.accountListHeight.h,
            width: Constant.accountListWidth.w,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  offset: const Offset(0, -2),
                  blurRadius: Constant.accountListBorderBlurRadius,
                ),
              ],
            ),
            child: CustomScrollView(
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
                      (context, index) => wdg.AccountCard(
                        account: account.cards[index],
                      ),
                      childCount: account.cards.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
