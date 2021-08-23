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
            create: (_) => BottomNavigationBloc(),
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
  late BottomNavigationBloc _bottomNavigationBloc;

  @override
  void initState() {
    super.initState();
    _bottomNavigationBloc = context.read<BottomNavigationBloc>();
    _bottomNavigationBloc.add(BottomNavigationItemTapped(index: BottomNavigationItemIndex.home));
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
                  icon: Icons.home,
                  itemName: 'home',
                  isSelected: state.currentIndex == BottomNavigationItemIndex.home,
                  onTapped: () => _bottomNavigationBloc.add(
                    BottomNavigationItemTapped(index: BottomNavigationItemIndex.home),
                  ),
                ),
                BottomNavigationItem(
                  icon: Icons.account_balance,
                  itemName: 'account',
                  isSelected: state.currentIndex == BottomNavigationItemIndex.account,
                  onTapped: () => _bottomNavigationBloc.add(
                    BottomNavigationItemTapped(index: BottomNavigationItemIndex.account),
                  ),
                ),
                BottomNavigationItem(
                  icon: Icons.show_chart,
                  itemName: 'transaction',
                  isSelected: state.currentIndex == BottomNavigationItemIndex.transaction,
                  onTapped: () => _bottomNavigationBloc.add(
                    BottomNavigationItemTapped(index: BottomNavigationItemIndex.transaction),
                  ),
                ),
                BottomNavigationItem(
                  icon: Icons.settings,
                  itemName: 'setting',
                  isSelected: state.currentIndex == BottomNavigationItemIndex.setting,
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
