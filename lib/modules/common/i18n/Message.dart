import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Message extends Translations {
  static final Message _singleton = Message._internal();

  factory Message() => _singleton;

  Message._internal();

  // support language
  static const englishLocale = Locale('en', 'US');
  static const chineseLocale = Locale('zh', 'TW');

  // account
  // form
  static const String accountName = "ACCOUNT_NAME";

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          accountName: 'Name:',
        },
        'zh_TW': {
          accountName: '名稱：',
        }
      };
}
