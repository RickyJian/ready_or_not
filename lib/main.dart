import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ready_or_not/account/ui/account.dart';
import 'package:ready_or_not/common/bloc/bottom_navigation_bloc.dart';
import 'package:ready_or_not/common/widget/bottom_navigation_item.dart';
import 'package:ready_or_not/home/ui/home.dart';
import 'package:ready_or_not/setting/ui/setting.dart';
import 'package:ready_or_not/transaction/ui/transaction.dart';

void main() {
  Bloc.observer = AppObserver();
  runApp(App());
}

class AppObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ready Or Not',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<BottomNavigationBloc>(
        create: (BuildContext context) => BottomNavigationBloc(),
        child: AppPage(),
      ),
    );
  }
}

class AppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bottomNavigationBloc =
        BlocProvider.of<BottomNavigationBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Ready Or Not'),
      ),
      body: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        bloc: _bottomNavigationBloc,
        builder: (BuildContext context, BottomNavigationState state) {
          if (state is PageLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is HomePageLoaded) {
            return HomePage();
          } else if (state is AccountingPageLoaded) {
            return AccountPage();
          } else if (state is TransactionPageLoaded) {
            return TransactionPage();
          } else if (state is SettingPageLoaded) {
            return SettingPage();
          }
          // TODO; return no page
          return Container();
        },
      ),
      bottomNavigationBar:
          BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        bloc: _bottomNavigationBloc,
        builder: (BuildContext context, BottomNavigationState state) {
          return BottomAppBar(
            shape: CircularNotchedRectangle(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BottomNavigationItem(
                  icon: Icon(Icons.home),
                  label: Text('home'),
                  onTapped: () => _bottomNavigationBloc.add(
                    PageTapped(index: 0),
                  ),
                ),
                BottomNavigationItem(
                  icon: Icon(Icons.account_balance),
                  label: Text('account'),
                  onTapped: () => _bottomNavigationBloc.add(
                    PageTapped(index: 1),
                  ),
                ),
                BottomNavigationItem(
                  icon: Icon(Icons.show_chart),
                  label: Text('transaction'),
                  onTapped: () => _bottomNavigationBloc.add(
                    PageTapped(index: 2),
                  ),
                ),
                BottomNavigationItem(
                  icon: Icon(Icons.settings),
                  label: Text('setting'),
                  onTapped: () => _bottomNavigationBloc.add(
                    PageTapped(index: 3),
                  ),
                )
              ],
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('press add');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
