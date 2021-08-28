part of 'bottom_navigation_bloc.dart';

abstract class BottomNavigationEvent extends Equatable {
  const BottomNavigationEvent();

  @override
  List<Object> get props => [];
}

class BottomNavigationItemTapped extends BottomNavigationEvent {
  final BottomNavItem index;

  const BottomNavigationItemTapped({required this.index});

  @override
  String toString() => 'Bottom navigation item tapped: $index';
}
