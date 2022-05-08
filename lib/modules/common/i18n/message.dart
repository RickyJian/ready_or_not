import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Message extends Translations {
  static final Message _singleton = Message._internal();

  factory Message() => _singleton;

  Message._internal();

  // support language
  static const englishLocale = Locale('en', 'US');
  static const chineseLocale = Locale('zh', 'TW');

  // currency
  static const String currencyTypeNormal = 'ACCOUNT_FORM_UNIT_NORMAL';
  static const String currencyTypeSpecial = 'ACCOUNT_FORM_UNIT_SPECIAL';

  // account
  // form
  static const String accountFormName = 'ACCOUNT_FORM_NAME';
  static const String accountFormPrice = 'ACCOUNT_FORM_PRICE';
  static const String accountFormType = 'ACCOUNT_FORM_TYPE';
  static const String accountFormUnit = 'ACCOUNT_FORM_UNIT';
  static const String accountFormEnabled = 'ACCOUNT_FORM_ENABLED';
  static const String accountFormMemo = 'ACCOUNT_FORM_MEMO';
  static const String accountFormButtonGroup = 'ACCOUNT_FORM_BUTTON_GROUP';
  static const String accountFormButtonClose = 'ACCOUNT_FORM_BUTTON_CLOSE';
  static const String accountFormButtonSave = 'ACCOUNT_FORM_BUTTON_SAVE';

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          accountFormName: 'Name:',
          accountFormPrice: 'Price:',
          accountFormType: 'Type:',
          accountFormUnit: 'Unit:',
          accountFormEnabled: 'Enabled:',
          accountFormMemo: 'Memo:',
          accountFormButtonGroup: 'Button Group',
          currencyTypeNormal: 'Normal',
          currencyTypeSpecial: 'Special',
          accountFormButtonClose: 'Close',
          accountFormButtonSave: 'Save',
        },
        'zh_TW': {
          accountFormName: '名稱：',
          accountFormPrice: '金額：',
          accountFormType: '類型：',
          accountFormUnit: '單位：',
          accountFormEnabled: '啟用：',
          accountFormMemo: '備註：',
          accountFormButtonGroup: '按鈕群組',
          currencyTypeNormal: '一般',
          currencyTypeSpecial: '特殊',
          accountFormButtonClose: '關閉',
          accountFormButtonSave: '存檔',
        }
      };
}
