import 'package:flutter/material.dart';

class TransactionPage extends StatelessWidget {
  final String text;

  TransactionPage({this.text}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('This page is transaction history'),
      ),
    );
  }
}
