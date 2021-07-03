import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:ready_or_not/account/model/account_model.dart';
import 'package:ready_or_not/account/widget/account_card.dart';
import 'package:ready_or_not/account/widget/account_info.dart';
import 'package:ready_or_not/currency/model/currency.dart';
import 'package:sizer/sizer.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation, DeviceType deviceType) {
        return NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Container(
                      color: Color(0xFFF6F6F6),
                      height: 15.h,
                      child: Row(
                        children: [
                          AccountInfoItem(
                            name: 'Assets',
                            value: Decimal.parse('10000.01'),
                            type: accountInfoType.assets,
                          ),
                          AccountInfoPartition(),
                          AccountInfoItem(
                            name: 'Liability',
                            value: Decimal.parse('100.01'),
                            type: accountInfoType.liabilities,
                          ),
                          AccountInfoPartition(),
                          AccountInfoItem(
                            name: 'Net Assets',
                            value: Decimal.parse('100.01'),
                            type: accountInfoType.netAssets,
                          ),
                        ],
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
                SliverAppBar(
                  title: Text(
                    'Total: 10',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15.sp,
                    ),
                  ),
                  elevation: 0,
                  pinned: true,
                  actions: [
                    TextButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.sort,
                        size: 20.sp,
                      ),
                    ),
                  ],
                  backgroundColor: Colors.white,
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      AccountCard(
                        account: Account.card(
                          name: 'First Account',
                          memo: 'First account description',
                          amount: Decimal.fromInt(1000),
                          enabled: true,
                          currencyName: 'NTD',
                          currencyType: CurrencyType.basic,
                        ),
                      ),
                      AccountCard(
                        account: Account.card(
                          name: 'Second Account',
                          memo: 'Second account description',
                          amount: Decimal.fromInt(-200),
                          enabled: true,
                          currencyName: 'USD',
                          currencyType: CurrencyType.basic,
                        ),
                      ),
                      AccountCard(
                        account: Account.card(
                          name: 'Third Account',
                          memo: 'Third account description',
                          amount: Decimal.fromInt(100),
                          enabled: true,
                          currencyName: 'JPN',
                          currencyType: CurrencyType.basic,
                        ),
                      ),
                      AccountCard(
                        account: Account.card(
                          name: 'Virtual Account',
                          memo: 'Virtual account description',
                          amount: Decimal.one,
                          enabled: true,
                          currencyName: 'POINTS',
                          currencyType: CurrencyType.special,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
