import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ready_or_not/account/widget/const.dart' as constant;
import 'package:sizer/sizer.dart';

class AccountInfo extends StatelessWidget {
  final Decimal assetsAmount;
  final Decimal liabilityAmount;
  final Decimal netAssetsAmount;

  AccountInfo({required this.assetsAmount, required this.liabilityAmount, required this.netAssetsAmount});

  AccountInfo.init()
      : assetsAmount = Decimal.zero,
        liabilityAmount = Decimal.zero,
        netAssetsAmount = Decimal.zero;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AccountInfoItem(
          name: constant.assets,
          value: assetsAmount,
          type: constant.accountInfoType.assets,
        ),
        _partition(),
        AccountInfoItem(
          name: constant.liability,
          value: liabilityAmount,
          type: constant.accountInfoType.liabilities,
        ),
        _partition(),
        AccountInfoItem(
          name: constant.netAssets,
          value: netAssetsAmount,
          type: constant.accountInfoType.netAssets,
        ),
      ],
    );
  }

  Widget _partition() {
    return Container(
      width: 1,
      height: 10.h,
      color: Colors.grey.withOpacity(0.8),
    );
  }
}

class AccountInfoItem extends StatelessWidget {
  final String name;
  final Decimal value;
  final constant.accountInfoType type;

  AccountInfoItem({required this.name, required this.value, required this.type});

  @override
  Widget build(BuildContext context) {
    Color _color;
    switch (type) {
      case constant.accountInfoType.assets:
        _color = Colors.green;
        break;
      case constant.accountInfoType.liabilities:
        _color = Colors.red;
        break;
      case constant.accountInfoType.netAssets:
        if (!value.isNegative) {
          _color = Colors.green;
        } else {
          _color = Colors.red;
        }
        break;
    }
    return Expanded(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 15.sp,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(top: 1.5.h, bottom: 1.5),
              child: Text(
                value.toDouble().toString(),
                style: TextStyle(
                  color: _color,
                  fontSize: 17.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
