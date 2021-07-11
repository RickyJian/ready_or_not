part of 'bottom_navigation_bloc.dart';

abstract class BottomNavigationState extends Equatable {
  const BottomNavigationState();

  BottomNavigationItemIndex get currentIndex => BottomNavigationItemIndex.unspecified;

  @override
  List<Object> get props => [];
}

class PageLoading extends BottomNavigationState {
  @override
  String toString() => 'Page loading';
}

class BottomNavigationItemNotFound extends BottomNavigationState {
  final BottomNavigationItemIndex index;

  BottomNavigationItemNotFound({@required this.index});

  @override
  String toString() => 'Bottom navigation item not found: item index is $index';
}

class BottomNavigationLoading extends BottomNavigationState {
  @override
  String toString() => 'Bottom navigation loading';
}

class HomePageLoading extends BottomNavigationState {
  @override
  BottomNavigationItemIndex get currentIndex => BottomNavigationItemIndex.home;

  @override
  String toString() => 'Home page loading';
}

class AccountPageLoading extends BottomNavigationState {
  @override
  BottomNavigationItemIndex get currentIndex => BottomNavigationItemIndex.account;

  @override
  String toString() => 'Account page loading';
}

class TransactionPageLoading extends BottomNavigationState {
  @override
  BottomNavigationItemIndex get currentIndex => BottomNavigationItemIndex.transaction;

  @override
  String toString() => 'Transaction page loading';
}

class SettingPageLoading extends BottomNavigationState {
  @override
  BottomNavigationItemIndex get currentIndex => BottomNavigationItemIndex.setting;

  @override
  String toString() => 'Setting page loading';
}
