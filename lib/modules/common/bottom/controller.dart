import 'package:get/get.dart';

import 'component.dart';

class BottomController extends GetxController {
  var index = BottomNavItemIndex.home.obs;

  void changeItem(BottomNavItemIndex index) => this.index.value = index;
}
