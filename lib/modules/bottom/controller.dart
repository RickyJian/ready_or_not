import 'package:get/get.dart';
import 'package:ready_or_not/modules/common/common.dart';

class BottomController extends GetxController {
  var index = BottomNavItem.home.obs;

  changeNavItem(BottomNavItem index) => this.index.value = index;
}
