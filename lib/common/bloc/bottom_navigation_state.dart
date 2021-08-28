part of 'bottom_navigation_bloc.dart';

abstract class BottomNavigationState extends Equatable {
  const BottomNavigationState();

  get index => BottomNavItem.unspecified;

  @override
  List<Object> get props => [index];
}

class PageLoading extends BottomNavigationState {
  @override
  String toString() => 'Page loading';
}

class BottomNavigationItemNotFound extends BottomNavigationState {
  @override
  final BottomNavItem index;

  BottomNavigationItemNotFound({required this.index});

  @override
  String toString() => 'Bottom navigation item not found: item index is $index';
}

class HomePageLoading extends BottomNavigationState {
  @override
  get index => BottomNavItem.home;

  @override
  String toString() => 'Home page loading';
}

class AccountPageLoading extends BottomNavigationState {
  @override
  get index => BottomNavItem.account;

  @override
  String toString() => 'Account page loading';
}

class TransactionPageLoading extends BottomNavigationState {
  @override
  get index => BottomNavItem.transaction;

  @override
  String toString() => 'Transaction page loading';
}

class SettingPageLoading extends BottomNavigationState {
  @override
  get index => BottomNavItem.setting;

  @override
  String toString() => 'Setting page loading';
}
