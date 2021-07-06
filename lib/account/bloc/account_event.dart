part of 'account_bloc.dart';

abstract class AccountEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetAccount extends AccountEvent {
  @override
  String toString() => 'get account';
}

class ListAccount extends AccountEvent {
  @override
  String toString() => 'list account';
}

class CreateAccount extends AccountEvent {
  @override
  String toString() => 'create account';
}

class UpdateAccount extends AccountEvent {
  @override
  String toString() => 'update account';
}

class SetAccountEnabled extends AccountEvent {
  @override
  String toString() => 'set account enabled';
}
