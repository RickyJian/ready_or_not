import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ready_or_not/modules/account/account.dart';
import 'package:ready_or_not/modules/modules.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) => runApp(App()));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO:
    //  1) theme: light ,dark, font family(openhuninn)
    //  2) i18n
    return GetMaterialApp(
      title: 'Ready Or Not',
      debugShowCheckedModeBanner: false,
      home: AppPage(),
    );
  }
}

class AppPage extends StatelessWidget {
  final BottomController _bottomController = Get.put(BottomController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ready Or Not'),
      ),
      body: GetX<BottomController>(
        init: BottomController(),
        builder: (item) {
          switch (item.index.value) {
            case BottomNavItemIndex.home:
              return Center(
                child: Text('home'),
              );
            case BottomNavItemIndex.account:
              return Center(
                child: AccountListPage(),
              );
            case BottomNavItemIndex.transaction:
              return Center(
                child: Text('transaction'),
              );
            case BottomNavItemIndex.setting:
              return Center(
                child: Text('setting'),
              );
          }
        },
      ),
      bottomNavigationBar: GetX<BottomController>(
        init: BottomController(),
        builder: (item) => BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: BottomNavBar(
            currentIndex: item.index.value,
            items: [
              BottomNavItem(name: "HONE", icon: Icons.home, index: BottomNavItemIndex.home),
              BottomNavItem(name: "ACCOUNT", icon: Icons.account_balance, index: BottomNavItemIndex.account),
              BottomNavItem(name: "TRANSACTION", icon: Icons.show_chart, index: BottomNavItemIndex.transaction),
              BottomNavItem(name: "SETTING", icon: Icons.settings, index: BottomNavItemIndex.setting),
            ],
            onTapped: (index) => _bottomController.changeItem(index),
          ),
        ),
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
