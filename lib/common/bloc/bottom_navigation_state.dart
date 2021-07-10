part of 'bottom_navigation_bloc.dart';

abstract class BottomNavigationState extends Equatable {
  const BottomNavigationState();

  @override
  List<Object> get props => [];
}

class PageLoading extends BottomNavigationState {
  @override
  String toString() => 'Page loading';
}

class BottomNavigationItemNotFound extends BottomNavigationState {
  final BottomNavigationItemIndex index;

  const BottomNavigationItemNotFound({@required this.index});

  @override
  String toString() => 'Bottom navigation item not found: item index is $index';
}

class BottomNavigationLoading extends BottomNavigationState {
  @override
  String toString() => 'Bottom navigation loading';
}

class HomePageLoading extends BottomNavigationState {
  @override
  String toString() => 'Home page loading';
}

class AccountPageLoading extends BottomNavigationState {
  @override
  String toString() => 'Account page loading';
}

class TransactionPageLoading extends BottomNavigationState {
  @override
  String toString() => 'Transaction page loading';
}

class SettingPageLoading extends BottomNavigationState {
  @override
  String toString() => 'Setting page loading';
}
