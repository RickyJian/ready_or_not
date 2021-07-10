import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ready_or_not/account/bloc/account_bloc.dart';
import 'package:ready_or_not/account/view/account_list.dart';
import 'package:ready_or_not/common/common.dart';
import 'package:ready_or_not/home/ui/home.dart';
import 'package:ready_or_not/setting/ui/setting.dart';
import 'package:ready_or_not/transaction/ui/transaction.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) => runApp(App()));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ready Or Not',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'openhuninn',
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) =>
                BottomNavigationBloc()..add(BottomNavigationItemTapped(index: BottomNavigationItemIndex.home)),
          ),
          BlocProvider(
            create: (_) => AccountBloc(),
          ),
        ],
        child: AppPage(),
      ),
    );
  }
}

class AppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bottomNavigationBloc = BlocProvider.of<BottomNavigationBloc>(context);

    return Scaffold(
      // TODO: update title when tap bottom item
      appBar: AppBar(
        title: Text('Ready Or Not'),
      ),
      body: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (context, state) {
          if (state is PageLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is HomePageLoading) {
            return HomePage();
          } else if (state is AccountPageLoading) {
            return AccountPage();
          } else if (state is TransactionPageLoading) {
            return TransactionPage();
          } else if (state is SettingPageLoading) {
            return SettingPage();
          }
          // TODO; return no page
          return Container();
        },
      ),
      bottomNavigationBar: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (context, state) {
          return BottomAppBar(
            shape: CircularNotchedRectangle(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BottomNavigationItem(
                  icon: Icon(Icons.home),
                  label: Text('home'),
                  onTapped: () => _bottomNavigationBloc.add(
                    BottomNavigationItemTapped(index: BottomNavigationItemIndex.home),
                  ),
                ),
                BottomNavigationItem(
                  icon: Icon(Icons.account_balance),
                  label: Text('account'),
                  onTapped: () => _bottomNavigationBloc.add(
                    BottomNavigationItemTapped(index: BottomNavigationItemIndex.account),
                  ),
                ),
                BottomNavigationItem(
                  icon: Icon(Icons.show_chart),
                  label: Text('transaction'),
                  onTapped: () => _bottomNavigationBloc.add(
                    BottomNavigationItemTapped(index: BottomNavigationItemIndex.transaction),
                  ),
                ),
                BottomNavigationItem(
                  icon: Icon(Icons.settings),
                  label: Text('setting'),
                  onTapped: () => _bottomNavigationBloc.add(
                    BottomNavigationItemTapped(index: BottomNavigationItemIndex.setting),
                  ),
                )
              ],
            ),
          );
        },
      ),
      // TODO: update floating item when tap bottom item
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
