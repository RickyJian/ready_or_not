import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';
import 'package:ready_or_not/account/model/account_model.dart';
import 'package:ready_or_not/currency/model/currency.dart';

part 'account_event.dart';

part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  // TODO: add repository

  AccountBloc() : super(AccountLoading());

  @override
  Stream<AccountState> mapEventToState(
    AccountEvent event,
  ) async* {
    yield AccountLoading();
    if (event is GetAccount) {
      // TODO: get account
    } else if (event is ListAccount) {
      yield* _mapAccountListToState();
    } else if (event is CreateAccount) {
      // TODO: create account
    } else if (event is UpdateAccount) {
      // TODO: update account
    } else if (event is SetAccountEnabled) {
      // TODO: set account enabled
    }
  }

  Stream<AccountState> _mapAccountListToState() async* {
    try {
      // TODO: remove mock data
      final accounts = <Account>[
        Account.card(
          name: 'First Account',
          memo: 'First account description',
          amount: Decimal.fromInt(1000),
          enabled: true,
          currencyName: 'NTD',
          currencyType: CurrencyType.basic,
        ),
        Account.card(
          name: 'Second Account',
          memo: 'Second account description',
          amount: Decimal.fromInt(-200),
          enabled: true,
          currencyName: 'USD',
          currencyType: CurrencyType.basic,
        ),
        Account.card(
          name: 'Third Account',
          memo: 'Third account description',
          amount: Decimal.fromInt(100),
          enabled: true,
          currencyName: 'JPN',
          currencyType: CurrencyType.basic,
        ),
        Account.card(
          name: 'Virtual Account',
          memo: 'Virtual account description',
          amount: Decimal.one,
          enabled: true,
          currencyName: 'POINTS',
          currencyType: CurrencyType.special,
        ),
      ];
      yield AccountLoading(accounts: accounts, hasNextPageToken: false);
    } catch (error) {
      yield AccountFailed(error: error);
    }
  }
}
