import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ready_or_not/modules/currency/currency.dart';

import '../account/components/card.dart';

class AccountController extends GetxController {
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    count();
    listAccounts();
    super.onInit();
  }

  var total = 0.obs;
  var assets = Decimal.zero.obs;
  var liability = Decimal.zero.obs;
  var netAssets = Decimal.zero.obs;

  // TODO: query from db
  count() {
    total.value = 100;
    assets.value = Decimal.parse("100");
    liability.value = Decimal.parse("20");
    netAssets.value = assets.value - liability.value;
  }

  var page = 0;
  var cards = <AccountCard>[].obs;

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

  List<AccountCard> _fetchAccounts() {
    return List.generate(
      10,
      (index) {
        var id = page * 10 + index + 1;
        return AccountCard(
          id: id,
          name: 'Account $id',
          memo: 'Account $id description',
          amount: Decimal.parse("10") * Decimal.fromInt(id),
          enabled: true,
          currencyName: 'NTD',
          currencyType: CurrencyType.basic,
        );
      },
    );
  }
}
