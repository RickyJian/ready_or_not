import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ready_or_not/common/common.dart';

part 'bottom_navigation_event.dart';

part 'bottom_navigation_state.dart';

class BottomNavigationBloc extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(PageLoading());

  @override
  Stream<BottomNavigationState> mapEventToState(
    BottomNavigationEvent event,
  ) async* {
    yield PageLoading();

    if (event is BottomNavigationItemTapped) {
      switch (event.index) {
        case BottomNavItem.home:
          {
            yield HomePageLoading();
          }
          break;
        case BottomNavItem.account:
          {
            yield AccountPageLoading();
          }
          break;
        case BottomNavItem.transaction:
          {
            yield TransactionPageLoading();
          }
          break;
        case BottomNavItem.setting:
          {
            yield SettingPageLoading();
          }
          break;
        default:
          yield BottomNavigationItemNotFound(index: event.index);
          break;
      }
    }
  }
}
