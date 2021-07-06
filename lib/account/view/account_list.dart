import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ready_or_not/account/bloc/account_bloc.dart';
import 'package:ready_or_not/account/widget/account_card.dart';
import 'package:ready_or_not/account/widget/account_info.dart';
import 'package:sizer/sizer.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPage createState() => _AccountPage();
}

class _AccountPage extends State<AccountPage> {
  AccountBloc _accountBloc;

  @override
  void initState() {
    super.initState();
    _accountBloc = context.read<AccountBloc>();
    _accountBloc.add(ListAccount());
  }

  @override
  void dispose() {
    super.dispose();
  }

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
                BlocBuilder<AccountBloc, AccountState>(
                  bloc: _accountBloc,
                  builder: (context, state) {
                    if (state is AccountLoading) {
                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => AccountCard(
                            account: state.accounts[index],
                          ),
                          childCount: state.accounts.length,
                        ),
                      );
                    } else if (state is AccountFailed) {
                      return const Center(child: Text('failed to fetch posts'));
                    }
                    return SliverList(delegate: SliverChildListDelegate([]));
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
