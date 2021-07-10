import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:ready_or_not/common/bloc/const.dart';

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
        case BottomNavigationItemIndex.home:
          {
            yield HomePageLoading();
          }
          break;
        case BottomNavigationItemIndex.account:
          {
            yield AccountPageLoading();
          }
          break;
        case BottomNavigationItemIndex.transaction:
          {
            yield TransactionPageLoading();
          }
          break;
        case BottomNavigationItemIndex.setting:
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
