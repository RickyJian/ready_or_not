import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ready_or_not/modules/common/common.dart' as common;
import 'package:ready_or_not/modules/currency/currency.dart';

import 'components/components.dart';

class AccountController extends GetxController with GetSingleTickerProviderStateMixin {
  // TODO: remove test data
  List<AccountCardComponent> _generateAccounts({int page = 0, int number = 10}) {
    return List.generate(
      number,
      (index) {
        var id = page * number + index + 1;
        var amount = Decimal.parse("10") * Decimal.fromInt(id);
        return AccountCardComponent(
          id: id,
          name: 'Account $id',
          amount: id % 4 == 0 ? -amount : amount,
          type: common.CurrencyType.normal,
          unit: 'NTD',
          enabled: id % 3 == 0 ? false : true,
          createTime: 0,
          memo: 'Account $id description',
        );
      },
    );
  }

  late final AnimationController formAnimationController;
  late final Animation<double> formAnimation;

  @override
  onInit() {
    /// list info
    count();

    /// card list
    accountCardListTotal.value = 50;
    listAccounts(0, accountCardListEnabled.value);
    page = 1;

    scrollController.addListener(() {
      if (page < 5 && scrollController.position.maxScrollExtent == scrollController.position.pixels) {
        listAccounts(page, accountCardListEnabled.value);
        page++;
      }
    });

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

    /// animations
    /// list cards fade in
    formAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    formAnimation = CurvedAnimation(
      parent: formAnimationController,
      curve: Curves.easeInOut,
    );
    formAnimationController.forward();
    super.onInit();
  }

  @override
  onClose() {
    scrollController.dispose();
    formAnimationController.dispose();
  }

  /// list info
  var assets = Decimal.zero.obs;
  var liabilities = Decimal.zero.obs;
  var netAssets = Decimal.zero.obs;

  // TODO: count from db
  count([reload = common.AccountInfoType.all]) async {
    for (var card in _generateAccounts(number: 50)) {
      if (!card.amount.isNegative &&
          (reload == common.AccountInfoType.all || reload == common.AccountInfoType.assets)) {
        assets.value += card.amount;
      }
      if (card.amount.isNegative &&
          (reload == common.AccountInfoType.all || reload == common.AccountInfoType.liabilities)) {
        liabilities.value += card.amount;
      }
      if (reload == common.AccountInfoType.all || reload == common.AccountInfoType.netAssets) {
        netAssets.value += card.amount;
      }
    }
  }

  /// list card info
  final ScrollController scrollController = ScrollController();

  var accountCardListTotal = 0.obs;
  var accountCardListEnabled = false.obs;
  var cards = <AccountCardComponent>[].obs;
  var page = 0;

  filterCards(bool enabled) {
    accountCardListEnabled.value = enabled;
    scrollController.animateTo(0, duration: const Duration(seconds: 1), curve: Curves.linear);
    listAccounts(0, enabled);
    page = 1;
  }

  // TODO: query from db
  listAccounts([int page = 0, bool enabled = true]) async {
    if (page == 0) {
      cards.clear();
    }
    cards.addAll(_generateAccounts(page: page).where((card) => (enabled && card.enabled) || (!enabled)).toList());
  }

  /// Account form behavior
  final CurrencyController currencyController = CurrencyController();

  // TODO: query from db
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
