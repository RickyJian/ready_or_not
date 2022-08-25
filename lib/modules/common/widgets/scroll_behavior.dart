import 'package:flutter/material.dart';

class GlowlessScrollBehavior extends ScrollBehavior {
  static final _singleton = GlowlessScrollBehavior._internal();

  factory GlowlessScrollBehavior() => _singleton;

  GlowlessScrollBehavior._internal();

  // TODO: singletone
  @override
  Widget buildViewportChrome(context, child, axisDirection) => child;
}
