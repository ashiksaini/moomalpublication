import 'package:moomalpublication/features/auth/data/models/login_response_data.dart';
import 'package:moomalpublication/services/storage/shared_preferences_helper.dart';
import 'package:moomalpublication/services/storage/shared_preferences_keys.dart';

class Utility {
  Utility._();

  static Future<void> saveLoginDataToLocal(LoginResponseData data, bool rememberMe, String password) async {
    await SharedPreferencesHelper.setValue(SharedPreferenceKeys.username, data.username);
    await SharedPreferencesHelper.setValue(SharedPreferenceKeys.email, data.email);
    await SharedPreferencesHelper.setValue(SharedPreferenceKeys.role, data.role);
    await SharedPreferencesHelper.setValue(SharedPreferenceKeys.avatarUrl, data.avatarUrl);

    await SharedPreferencesHelper.setValue(SharedPreferenceKeys.isLogin, true);
    await SharedPreferencesHelper.setValue(SharedPreferenceKeys.rememberMe, rememberMe);

    if (rememberMe) {
      await SharedPreferencesHelper.setValue(SharedPreferenceKeys.password, password);
    } else {
      await SharedPreferencesHelper.remove(SharedPreferenceKeys.password);
    }
  }
}
