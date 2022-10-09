import 'package:get/get.dart';
import 'package:ready_or_not/modules/common/common.dart' as common;

class HomeController extends GetxController {
  var statisticItem = common.StatisticItem.line.obs;

  changeStatisticItem(common.StatisticItem item) => statisticItem.value = item;
}
