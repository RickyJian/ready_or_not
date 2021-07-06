part of 'account_bloc.dart';

abstract class AccountState extends Equatable {
  const AccountState();
}

class AccountLoading extends AccountState {
  final List<Account> accounts;
  final String pageToken;
  final bool hasNextPageToken;
  final int limit;

  const AccountLoading({this.accounts, this.pageToken, this.hasNextPageToken, this.limit});

  @override
  List<Object> get props => [accounts, hasNextPageToken];

  @override
  String toString() => 'account loading state';
}

class AccountSuccess extends AccountState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'account success state';
}

class AccountFailed extends AccountState {
  final Error error;

  const AccountFailed({this.error});

  @override
  List<Object> get props => [];

  @override
  String toString() => 'account success state';
}
