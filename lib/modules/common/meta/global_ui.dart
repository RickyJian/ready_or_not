import 'package:flutter/material.dart';

class GlobalUI {
  static final GlobalUI _singleton = GlobalUI._internal();

  factory GlobalUI() => _singleton;

  GlobalUI._internal();

  late BuildContext _context;

  set context(BuildContext context) => _context = context;

  double getScreenWidth({double shifted = 0}) => MediaQuery.of(_context).size.width;

  double getScreenHeight({double shifted = 0}) => MediaQuery.of(_context).size.height;

  double getTopPadding({double shifted = 0}) => MediaQuery.of(_context).padding.top + shifted;
}
