import 'package:flutter/material.dart';

class GlowlessScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(context, child, axisDirection) => child;
}
