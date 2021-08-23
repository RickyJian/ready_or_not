part of 'account_bloc.dart';

abstract class AccountState extends Equatable {
  const AccountState();
}

class AccountLoading extends AccountState {
  const AccountLoading();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'account loading state';
}

class AccountSuccess extends AccountState {
  final AccountInfo info;

  final int total;

  final List<Account> accounts;
  final String pageToken;
  final bool hasNextPageToken;
  final int limit;

  AccountSuccess(
      {required this.info,
      required this.accounts,
      this.pageToken = '',
      this.hasNextPageToken = false,
      this.limit = 10,
      this.total = 0});

  @override
  List<Object> get props => [info, accounts, pageToken, hasNextPageToken, limit, total];

  @override
  String toString() => 'account success state';
}

class AccountFailed extends AccountState {
  final Error error;

  AccountFailed({required this.error});

  @override
  List<Object> get props => [];

  @override
  String toString() => 'account success state';
}
