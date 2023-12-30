import 'package:get/get.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/services/storage/shared_preferences_helper.dart';
import 'package:moomalpublication/services/storage/shared_preferences_keys.dart';

class ProfileController extends BaseController {
  RxString userName = RxString("");
  RxString userEmail = RxString("");
  RxString userAvatar = RxString("");

  @override
  void onInit() {
    super.onInit();

    _getUserInfo();
  }

  Future<void> _getUserInfo() async {
    userName.value = await SharedPreferencesHelper.getString(SharedPreferenceKeys.username) ?? "";
    userEmail.value = await SharedPreferencesHelper.getString(SharedPreferenceKeys.email) ?? "";
    userAvatar.value = await SharedPreferencesHelper.getString(SharedPreferenceKeys.avatarUrl) ?? "";
  }
}
