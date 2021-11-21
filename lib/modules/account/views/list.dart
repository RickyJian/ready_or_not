import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../components/components.dart' as cpn;
import '../controller.dart';
import '../widgets/widgets.dart' as wdg;

class AccountListPage extends StatelessWidget {
  final AccountController _accountController = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation, DeviceType deviceType) {
        return NestedScrollView(
          controller: _accountController.scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Container(
                      color: Color(0xFFF6F6F6),
                      height: 15.h,
                      child: GetX<AccountController>(
                        init: _accountController,
                        builder: (account) => wdg.AccountInfo(
                          infos: <cpn.AccountInfo>[
                            cpn.AccountInfo(
                              name: cpn.accountInfoType.assets.string(),
                              amount: account.assets.value,
                            ),
                            cpn.AccountInfo(
                              name: cpn.accountInfoType.liabilities.string(),
                              amount: account.liability.value,
                            ),
                            cpn.AccountInfo(
                              name: cpn.accountInfoType.netAssets.string(),
                              amount: account.netAssets.value,
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
            height: 85.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  offset: Offset(0, -2),
                  blurRadius: 8.0,
                ),
              ],
            ),
            child: CustomScrollView(
              slivers: [
                GetX<AccountController>(
                  init: _accountController,
                  builder: (account) => wdg.AccountCardInfo(total: account.total.value),
                ),
                GetX<AccountController>(
                  init: _accountController,
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
