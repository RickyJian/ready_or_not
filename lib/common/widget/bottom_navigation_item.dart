import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigationItem extends StatelessWidget {
  final IconData icon;
  final String itemName;
  final bool isSelected;
  final VoidCallback onTapped;

  const BottomNavigationItem(
      {required this.icon, required this.itemName, required this.isSelected, required this.onTapped});

  @override
  Widget build(BuildContext context) {
    var color = Colors.grey;
    if (isSelected) {
      color = Colors.blue;
    }
    return TextButton(
      onPressed: () => onTapped(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(
              icon,
              color: color,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              itemName,
              style: TextStyle(color: color),
            ),
          ),
        ],
      ),
    );
  }
}
