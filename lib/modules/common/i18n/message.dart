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

  /// account
  /// list
  static const String accountListInfoAssets = 'ACCOUNT_LIST_INFO_ASSETS';
  static const String accountListInfoLiabilities = 'ACCOUNT_LIST_INFO_LIABILITIES';
  static const String accountListInfoNetAssets = 'ACCOUNT_LIST_INFO_NET_ASSETS';

  /// form
  static const String accountFormName = 'ACCOUNT_FORM_NAME';
  static const String accountFormNameHintText = 'ACCOUNT_FORM_NAME_HINT_TEXT';
  static const String accountFormNameEmptyText = 'ACCOUNT_FORM_NAME_EMPTY_TEXT';
  static const String accountFormPrice = 'ACCOUNT_FORM_PRICE';
  static const String accountFormPriceHintText = 'ACCOUNT_FORM_PRICE_HINT_TEXT';
  static const String accountFormPriceEmptyText = 'ACCOUNT_FORM_PRICE_EMPTY_TEXT';
  static const String accountFormType = 'ACCOUNT_FORM_TYPE';
  static const String accountFormUnit = 'ACCOUNT_FORM_UNIT';
  static const String accountFormEnabled = 'ACCOUNT_FORM_ENABLED';
  static const String accountFormMemo = 'ACCOUNT_FORM_MEMO';
  static const String accountFormMemoHintText = 'ACCOUNT_FORM_MEMO_HINT_TEXT';
  static const String accountFormButtonGroup = 'ACCOUNT_FORM_BUTTON_GROUP';
  static const String accountFormButtonClose = 'ACCOUNT_FORM_BUTTON_CLOSE';
  static const String accountFormButtonSave = 'ACCOUNT_FORM_BUTTON_SAVE';

  /// error message
  static const String errAccountFormNameIsEmpty = 'ERR_ACCOUNT_FORM_NAME_IS_EMPTY';
  static const String errAccountFormPriceIsEmpty = 'ERR_ACCOUNT_FORM_PRICE_IS_EMPTY';
  static const String errAccountFormPriceIsInvalid = 'ERR_ACCOUNT_FORM_PRICE_IS_INVALID';

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          accountListInfoAssets: 'Assets',
          accountListInfoLiabilities: 'Liabilities',
          accountListInfoNetAssets: 'Net Assets',
          accountFormName: 'Name:',
          accountFormNameHintText: 'my account',
          accountFormNameEmptyText: 'account name cannot be empty',
          accountFormPrice: 'Price:',
          accountFormPriceHintText: '100',
          accountFormType: 'Type:',
          accountFormUnit: 'Unit:',
          accountFormEnabled: 'Enabled:',
          accountFormMemo: 'Memo:',
          accountFormMemoHintText: 'Stores bank money',
          accountFormButtonGroup: 'Button Group',
          currencyTypeNormal: 'Normal',
          currencyTypeSpecial: 'Special',
          accountFormButtonClose: 'Close',
          accountFormButtonSave: 'Save',
          errAccountFormNameIsEmpty: 'account name cannot be empty',
          errAccountFormPriceIsEmpty: 'account price cannot be empty',
          errAccountFormPriceIsInvalid: 'account price must be number',
        },
        'zh_TW': {
          accountListInfoAssets: '資產',
          accountListInfoLiabilities: '負債',
          accountListInfoNetAssets: '淨資產',
          accountFormName: '名稱：',
          accountFormNameHintText: '我的帳戶',
          accountFormNameEmptyText: '帳戶名稱不可為空',
          accountFormPrice: '金額：',
          accountFormPriceHintText: '100',
          accountFormType: '類型：',
          accountFormUnit: '單位：',
          accountFormEnabled: '啟用：',
          accountFormMemo: '備註：',
          accountFormMemoHintText: '儲存銀行金額',
          accountFormButtonGroup: '按鈕群組',
          currencyTypeNormal: '一般',
          currencyTypeSpecial: '特殊',
          accountFormButtonClose: '關閉',
          accountFormButtonSave: '存檔',
          errAccountFormNameIsEmpty: '帳戶名稱不可空白',
          errAccountFormPriceIsEmpty: '金額不可空白',
          errAccountFormPriceIsInvalid: '金額須為數字',
        }
      };
}
