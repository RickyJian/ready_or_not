import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ready_or_not/account/bloc/account_bloc.dart';
import 'package:ready_or_not/account/view/account_list.dart';
import 'package:ready_or_not/common/common.dart' as common;
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
            create: (_) => common.BottomNavigationBloc(),
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

class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  late common.BottomNavigationBloc _bottomNavigationBloc;

  @override
  void initState() {
    super.initState();
    _bottomNavigationBloc = context.read<common.BottomNavigationBloc>();
    _bottomNavigationBloc.add(common.BottomNavigationItemTapped(index: common.BottomNavItem.home));
  }

  @override
  void dispose() {
    _bottomNavigationBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: update title when tap bottom item
      appBar: AppBar(
        title: Text('Ready Or Not'),
      ),
      body: BlocBuilder<common.BottomNavigationBloc, common.BottomNavigationState>(
        builder: (context, state) {
          if (state is common.PageLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is common.HomePageLoading) {
            return HomePage();
          } else if (state is common.AccountPageLoading) {
            return AccountPage();
          } else if (state is common.TransactionPageLoading) {
            return TransactionPage();
          } else if (state is common.SettingPageLoading) {
            return SettingPage();
          }
          // TODO; return no page
          return Container();
        },
      ),
      bottomNavigationBar: BlocBuilder<common.BottomNavigationBloc, common.BottomNavigationState>(
        builder: (context, state) {
          return BottomAppBar(
            shape: CircularNotchedRectangle(),
            child: common.BottomNavigationBar(
              currentIndex: state.index,
              items: [
                common.BottomNavigationItem(
                  icon: Icons.home,
                  name: common.BottomNavItem.home,
                ),
                common.BottomNavigationItem(
                  icon: Icons.account_balance,
                  name: common.BottomNavItem.account,
                ),
                common.BottomNavigationItem(
                  icon: Icons.show_chart,
                  name: common.BottomNavItem.transaction,
                ),
                common.BottomNavigationItem(
                  icon: Icons.settings,
                  name: common.BottomNavItem.setting,
                ),
              ],
              onTapped: (index) => _bottomNavigationBloc.add(
                common.BottomNavigationItemTapped(index: index),
              ),
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
