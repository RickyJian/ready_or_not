import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sizer/sizer.dart';

import '../components/components.dart' as cpn;

class AccountInfo extends StatelessWidget {
  final List<cpn.AccountInfo> infos;

  AccountInfo({required this.infos});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: infos.asMap().entries.map((entry) => _infoItem(entry.value, entry.key != (infos.length - 1))).toList(),
    );
  }

  Widget _infoItem(cpn.AccountInfo info, [bool partition = false]) {
    return Expanded(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(
                    info.name,
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
                    info.amount.toDouble().toString(),
                    style: TextStyle(
                      // TODO: theme
                      color: Colors.green,
                      fontSize: 17.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
          partition ? _partition() : Center(),
        ],
      ),
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
