import 'package:get/get.dart';
import 'package:moomalpublication/core/base/base_controller.dart';

class OverallResultController extends BaseController {
  List<String> examName = ['Punit Test 1', 'Gk Test Quiz', 'Punit Test 2'];
  List<String> onlineExam = ["order_id".tr, "action".tr, "purchased_on".tr];
  List<String> overallPerformance = [
    "score".tr,
    "rank".tr,
    "total".tr,
    "correct".tr,
    "incorrect".tr,
    "skipped".tr,
    "action".tr,
  ];
}
