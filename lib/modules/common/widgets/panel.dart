import 'package:flutter/material.dart';

class Panel {
  static final Panel _singleton = Panel._internal();

  factory Panel() => _singleton;

  Panel._internal();

  getBoxShadow() => BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        offset: const Offset(0, -2),
        blurRadius: 8.0,
      );
}
