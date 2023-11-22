import 'package:get/get.dart';
 
class AppRouting {
  AppRouting._();

  // To navigate to nextScreen with arguments
  static void toNamed(String page, {dynamic argument}) {
    Get.toNamed<dynamic>(page, arguments: argument);
  }

  // To navigate and remove the previous screen from the tree.
  static void offNamed(String page, {dynamic argument}) {
    Get.offNamed<dynamic>(page, arguments: argument);
  }

  // To navigate and remove all previous screens from the tree.
  static void offAllNamed(String page, {dynamic argument}) {
    Get.offAllNamed<dynamic>(page, arguments: argument);
  }

  // remove prev and keep current screen
  static void offAndToNamed(String page , {dynamic argument}){
    Get.offAndToNamed<dynamic>(page,arguments: argument);
  }

  // until
  static void ofNamedUntil(String page , {dynamic argument}){
    Get.offNamedUntil<dynamic>(page, (route) => false);
  }

  // Pop navigation
  static void navigateBack() {
    Get.back<dynamic>();
  }

  // Get the current Route name
  static String getCurrentRouteName() {
    return Get.currentRoute;
  }
}
