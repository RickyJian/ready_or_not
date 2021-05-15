import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

part 'bottom_navigation_event.dart';

part 'bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  int currentIndex = 0;

  BottomNavigationBloc() : super(PageLoading());

  @override
  Stream<BottomNavigationState> mapEventToState(
    BottomNavigationEvent event,
  ) async* {
    if (state is AppStarted) {
      add(PageTapped(index: currentIndex));
    } else if (event is PageTapped) {
      currentIndex = event.index;
      yield PageLoading();

      switch (currentIndex) {
        case 0:
          {
            yield HomePageLoaded();
          }
          break;
        case 1:
          {
            yield AccountingPageLoaded();
          }
          break;
        case 2:
          {
            yield TransactionPageLoaded();
          }
          break;
        case 3:
          {
            yield SettingPageLoaded();
          }
          break;
        default:
          // TODO: add error page
          break;
      }
    }
  }
}
