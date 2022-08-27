import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ready_or_not/modules/setting/views/setting.dart';
import 'package:ready_or_not/modules/statistic/views/statistic.dart';
import 'package:sizer/sizer.dart';

import 'modules/modules.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) => runApp(App()));
}

class App extends StatelessWidget {
  @override
  Widget build(context) => Sizer(
        builder: (context, orientation, deviceType) => GetMaterialApp(
          title: 'Ready Or Not',
          debugShowCheckedModeBanner: false,
          translations: Message(),
          theme: Themes.light,
          darkTheme: Themes.dark,
          themeMode: ThemeMode.system,
          locale: Message.englishLocale,
          fallbackLocale: Message.englishLocale,
          home: AppPage(),
          getPages: [
            GetPage(name: BottomNavItem.home.id, page: () => DashboardPage()),
            GetPage(name: BottomNavItem.account.id, page: () => AccountListPage()),
            GetPage(name: BottomNavItem.statistic.id, page: () => StatisticPage()),
            GetPage(name: BottomNavItem.setting.id, page: () => SettingPage()),
          ],
        ),
      );
}

class AppPage extends StatelessWidget {
  final BottomController _bottomController = Get.put(BottomController());
  final AccountController _accountController = Get.put(AccountController());

  init(context) {
    GlobalUI().context = context;
  }

  @override
  Widget build(context) {
    init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          Message.appTitle.tr,
        ),
      ),
      body: GetX<BottomController>(
        init: _bottomController,
        builder: (item) => BottomNavigator(item: item.index.value),
      ),
      bottomNavigationBar: GetX<BottomController>(
        init: _bottomController,
        builder: (item) => BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: BottomNavBar(
            currentIndex: item.index.value,
            items: const [
              BottomNavButton(item: BottomNavItem.home, icon: Icons.home),
              BottomNavButton(item: BottomNavItem.account, icon: Icons.account_balance),
              BottomNavButton(item: BottomNavItem.statistic, icon: Icons.show_chart),
              BottomNavButton(item: BottomNavItem.setting, icon: Icons.settings),
            ],
            onTapped: (index) => item.changeNavItem(index),
          ),
        ),
      ),
      // TODO: update floating item when tap bottom item
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          switch (_bottomController.index.value) {
            case BottomNavItem.home:
              break;
            case BottomNavItem.account:
              Get.generalDialog(
                pageBuilder: (context, animation, secondaryAnimation) => GetX<AccountController>(
                  init: _accountController,
                  builder: (account) => AccountForm(
                    items: [
                      AccountFormText(
                        controller: _accountController.accountFormNameController,
                        label: Message.accountFormName.tr,
                        maxLength: 10,
                        maxLines: 1,
                        isFocus: true,
                        type: TextInputType.text,
                        hintText: Message.accountFormNameHintText.tr,
                        errorMessage: _accountController.accountFormNameErrorMessage.value,
                      ),
                      AccountFormText(
                        controller: _accountController.accountFormPriceController,
                        label: Message.accountFormPrice.tr,
                        maxLength: 8,
                        maxLines: 1,
                        type: TextInputType.number,
                        hintText: Message.accountFormPriceHintText.tr,
                        errorMessage: _accountController.accountFormPriceErrorMessage.value,
                      ),
                      AccountFormDropdown(
                        label: Message.accountFormType.tr,
                        selectedIndex: account.accountTypeSelected.value,
                        items: [
                          AccountFormDropdownItem(
                            index: CurrencyType.normal.index,
                            label: Message.currencyTypeNormal.tr,
                          ),
                          AccountFormDropdownItem(
                            index: CurrencyType.special.index,
                            label: Message.currencyTypeSpecial.tr,
                          ),
                        ],
                        // TODO: handle convert exception
                        onChanged: (value) => account.onChangeType(Util.convertToCurrencyType(value)),
                      ),
                      AccountFormDropdown(
                        label: Message.accountFormUnit.tr,
                        selectedIndex: account.accountUnitSelected.value,
                        // TODO: show currencies according to type
                        items: _accountController
                            .listCurrencies(
                                type: Util.convertToCurrencyType(_accountController.accountTypeSelected.value))
                            .asMap()
                            .entries
                            .map(
                              (entry) => AccountFormDropdownItem(
                                index: entry.key,
                                label: entry.value.name,
                              ),
                            )
                            .toList(),
                        onChanged: (value) => account.onChangeUnit(value),
                      ),
                      AccountFormSwitchButton(
                        label: Message.accountFormEnabled.tr,
                        enabled: account.accountEnabledSelected.value,
                        onChanged: (enabled) => account.onChangeEnabled(enabled),
                      ),
                      AccountFormText(
                        controller: _accountController.accountMemoController,
                        label: Message.accountFormMemo.tr,
                        maxLength: 50,
                        maxLines: 4,
                        type: TextInputType.text,
                        hintText: Message.accountFormMemoHintText.tr,
                      ),
                      AccountFormButtonGroup(
                        label: Message.accountFormButtonGroup.tr,
                        buttons: [
                          AccountFormButton(
                            label: Message.accountFormButtonClose.tr,
                            onPressed: () {
                              _accountController.resetForm();
                              Get.back();
                            },
                          ),
                          AccountFormButton(
                            label: Message.accountFormButtonSave.tr,
                            onPressed: () {
                              account.createAccount();
                              // Get.back();
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
              break;
            case BottomNavItem.statistic:
              break;
            case BottomNavItem.setting:
              break;
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
