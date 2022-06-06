import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ready_or_not/modules/common/common.dart' as common;
import 'package:ready_or_not/modules/currency/currency.dart';

import 'components/components.dart';

class AccountController extends GetxController {

  @override
  onInit() {
    /// list page
    count();
    listAccounts();

    /// form widget
    accountFormNameController.addListener(() {
      var errMsg = validateAccountName(accountFormNameController.value.text);
      if (errMsg != null) {
        accountFormNameErrorMessage.value = errMsg;
      } else {
        accountFormNameErrorMessage.value = '';
      }
    });
    accountFormPriceController.addListener(() {
      var errMsg = validateAccountPrice(accountFormPriceController.value.text);
      if (errMsg != null) {
        accountFormPriceErrorMessage.value = errMsg;
      } else {
        accountFormPriceErrorMessage.value = '';
      }
    });
    super.onInit();
  }

  @override
  onClose() {
    scrollController.dispose();
  }

  var total = 0.obs;
  var assets = Decimal.zero.obs;
  var liability = Decimal.zero.obs;
  var netAssets = Decimal.zero.obs;

  // TODO: query from db
  count() {
    total.value = 100;
    assets.value = Decimal.parse("100");
    liability.value = Decimal.parse("-20");
    netAssets.value = assets.value - liability.value;
  }

  final ScrollController scrollController = ScrollController();

  var page = 0;
  var cards = <AccountCardComponent>[].obs;

  // TODO: query from db
  listAccounts() {
    cards.value = _fetchAccounts();
    page++;
    scrollController.addListener(() {
      if (page < 5 && scrollController.position.maxScrollExtent == scrollController.position.pixels) {
        cards.addAll(_fetchAccounts());
        page++;
        update(); //update GetBuilder each time
      }
    });
  }

  List<AccountCardComponent> _fetchAccounts() {
    return List.generate(
      10,
      (index) {
        var id = page * 10 + index + 1;
        return AccountCardComponent(
          id: id,
          name: 'Account $id',
          memo: 'Account $id description',
          amount: Decimal.parse("10") * Decimal.fromInt(id),
          enabled: true,
          currencyName: 'NTD',
          currencyType: common.CurrencyType.normal,
        );
      },
    );
  }

  /// Account form behavior
  final CurrencyController currencyController = CurrencyController();

  List<Currency> listCurrencies({required common.CurrencyType type, bool onlyEnabled = false}) {
    if (type == common.CurrencyType.normal) {
      return [
        Currency(name: 'USD', type: common.CurrencyType.normal, exchangeRate: Decimal.parse('1.00')),
        Currency(name: 'TWD', type: common.CurrencyType.normal, exchangeRate: Decimal.parse('27.80')),
        Currency(name: 'JPY', type: common.CurrencyType.normal, exchangeRate: Decimal.parse('115.06')),
      ];
    }
    return [
      Currency(name: 'Points', type: common.CurrencyType.special, exchangeRate: Decimal.one),
    ];
  }

  final TextEditingController accountFormNameController = TextEditingController();
  var accountFormNameErrorMessage = ''.obs;

  String? validateAccountName(String? value) {
    if (value?.isEmpty ?? false || value!.isEmpty) {
      return common.Message.errAccountFormNameIsEmpty.tr;
    }
    return null;
  }

  final TextEditingController accountFormPriceController = TextEditingController();
  var accountFormPriceErrorMessage = ''.obs;

  String? validateAccountPrice(String? value) {
    if (value?.isEmpty ?? false || value!.isEmpty) {
      return common.Message.errAccountFormPriceIsEmpty.tr;
    } else if (value?.isEmpty ?? false || double.tryParse(value!) == null) {
      return common.Message.errAccountFormPriceIsInvalid.tr;
    }
    return null;
  }

  var accountTypeSelected = 0.obs;

  onChangeType(common.CurrencyType type) {
    currencyController.listCurrencyDropdownItems(type: type);
    accountUnitSelected.value = 0;
    accountTypeSelected.value = type.index;
  }

  var accountUnitSelected = 0.obs;

  onChangeUnit(int index) => accountUnitSelected.value = index;

  var accountEnabledSelected = true.obs;

  onChangeEnabled(bool enabled) => accountEnabledSelected.value = enabled;

  final TextEditingController accountMemoController = TextEditingController();

  /// TODO:
  ///  1) insert into db
  ///  2) when success reset form
  createAccount() {
    var accountNameErrMsg = validateAccountName(accountFormNameController.value.text);
    var accountPriceErrMsg = validateAccountPrice(accountFormPriceController.value.text);
    if (accountNameErrMsg != null) {
      accountFormNameErrorMessage.value = accountNameErrMsg;
    }
    if (accountPriceErrMsg != null) {
      accountFormPriceErrorMessage.value = accountPriceErrMsg;
    }
    if (accountNameErrMsg != null || accountPriceErrMsg != null) {
      return;
    }
  }

  resetForm() {
    accountFormNameController.clear();
    accountFormPriceController.clear();
    onChangeType(common.CurrencyType.normal);
    onChangeUnit(0);
    onChangeEnabled(true);
    accountMemoController.clear();
  }
}
