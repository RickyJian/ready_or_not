import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ready_or_not/account/bloc/account_bloc.dart';
import 'package:ready_or_not/account/widget/widget.dart';
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
    _accountBloc.close();
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
                      child: BlocBuilder<AccountBloc, AccountState>(
                        builder: (context, state) {
                          if (state is AccountSuccess) {
                            return AccountInfo(
                              assetsAmount: state.info.assets,
                              liabilityAmount: state.info.liability,
                              netAssetsAmount: state.info.netAssets,
                            );
                          } else if (state is AccountFailed) {
                            // TODO: error message
                          }
                          return AccountInfo.init();
                        },
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
                BlocBuilder<AccountBloc, AccountState>(
                  builder: (context, state) {
                    if (state is AccountSuccess) {
                      return AccountCardHeader(total: state.total);
                    } else if (state is AccountFailed) {
                      // TODO: error message
                    }
                    return AccountCardHeader.init();
                  },
                ),
                BlocBuilder<AccountBloc, AccountState>(
                  builder: (context, state) {
                    if (state is AccountSuccess) {
                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => AccountCard(
                            account: state.accounts[index],
                          ),
                          childCount: state.accounts.length,
                        ),
                      );
                    } else if (state is AccountFailed) {
                      // TODO: error message
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
