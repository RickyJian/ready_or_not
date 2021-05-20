import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sizer/sizer.dart';

enum accountInfoType { assets, liabilities, netAssets }

class AccountInfoItem extends StatelessWidget {
  final String name;
  final Decimal value;
  final accountInfoType type;

  AccountInfoItem({
    @required this.name,
    @required this.value,
    @required this.type,
  });

  @override
  Widget build(BuildContext context) {
    var _color;
    switch (type) {
      case accountInfoType.assets:
        _color = Colors.green;
        break;
      case accountInfoType.liabilities:
        _color = Colors.red;
        break;
      case accountInfoType.netAssets:
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
                '$value',
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

class AccountInfoPartition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 10.h,
      color: Colors.grey.withOpacity(0.8),
    );
  }
}
