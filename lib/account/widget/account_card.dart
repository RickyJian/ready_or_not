import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:ready_or_not/account/model/account_model.dart';
import 'package:ready_or_not/account/widget/const.dart' as constant;
import 'package:ready_or_not/currency/model/currency.dart';
import 'package:sizer/sizer.dart';

class AccountCardHeader extends StatelessWidget {
  final int total;

  // TODO: add filter

  AccountCardHeader({required this.total});

  AccountCardHeader.init() : total = 0;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(
        '${constant.total}: $total',
        style: TextStyle(
          color: Colors.blue,
          fontSize: 15.sp,
        ),
      ),
      elevation: 0,
      pinned: true,
      actions: [
        TextButton(
          // TODO: open filter
          onPressed: () {},
          child: Icon(
            Icons.sort,
            size: 20.sp,
          ),
        ),
      ],
      backgroundColor: Colors.white,
    );
  }
}

class AccountCard extends StatelessWidget {
  final Account account;

  AccountCard({required this.account});

  @override
  Widget build(BuildContext context) {
    var _color = Colors.green;
    if (account.amount.isNegative) {
      _color = Colors.red;
    }
    IconData _icon;
    switch (account.currencyType) {
      case CurrencyType.basic:
        _icon = Icons.monetization_on_outlined;
        break;
      case CurrencyType.special:
        _icon = Icons.cloud_queue_outlined;
        break;
    }
    return Padding(
      padding: EdgeInsets.only(
        top: 1.h,
        left: 3.w,
        right: 3.w,
        bottom: 2.h,
      ),
      child: Container(
        height: 40.h,
        width: 85.w,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    // TODO: change to chart
                    color: Colors.yellow,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                            ),
                          ),
                          child: Icon(
                            _icon,
                            size: 35.sp,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                account.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.sp,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 1.h,
                                  right: 2.w,
                                ),
                                child: Text(
                                  account.memo,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 10.sp,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(15),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                  right: 5.w,
                                ),
                                child: Text(
                                  account.amount.toDouble().toString(),
                                  style: TextStyle(
                                    color: _color,
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 1.h,
                                  right: 5.w,
                                ),
                                child: Text(
                                  account.currencyName,
                                  style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 10.sp,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
