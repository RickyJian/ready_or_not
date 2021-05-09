import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigationItem extends StatelessWidget {
  final Icon icon;
  final Text label;
  final VoidCallback onTapped;

  BottomNavigationItem(
      {@required this.icon, @required this.label, @required this.onTapped});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: icon,
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: label,
          ),
        ],
      ),
      onPressed: () => onTapped(),
    );
  }
}
