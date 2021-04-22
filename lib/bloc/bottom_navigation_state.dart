part of 'bottom_navigation_bloc.dart';

abstract class BottomNavigationState extends Equatable {
  const BottomNavigationState();

  @override
  List<Object> get props => [];
}

class PageLoading extends BottomNavigationState {
  @override
  String toString() => 'Page loading...';
}

class HomePageLoaded extends BottomNavigationState {
  @override
  String toString() => 'Home page loaded';
}

class AccountingPageLoaded extends BottomNavigationState {
  @override
  String toString() => 'Account page loaded';
}

class TransactionPageLoaded extends BottomNavigationState {
  @override
  String toString() => 'Transaction page loaded';
}

class SettingPageLoaded extends BottomNavigationState {
  @override
  String toString() => 'Setting page loaded';
}
