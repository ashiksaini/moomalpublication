import 'dart:math';

import 'package:moomalpublication/features/auth/data/models/login_response_data.dart';
import 'package:moomalpublication/services/storage/shared_preferences_helper.dart';
import 'package:moomalpublication/services/storage/shared_preferences_keys.dart';
import 'package:url_launcher/url_launcher.dart';

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

  static Future<void> launchurl(String url) async {
    Uri uri = Uri.parse(url);
    try {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e) {
      throw 'Could not launch $url';
    }
  }

  static String generateTransactionId() {
    // Maximum length of the transaction ID
    const int maxTransactionIdLength = 25;

    // Allowed characters in the transaction ID
    const String allowedCharacters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

    // Generate a random transaction ID
    String transactionId = '';
    Random random = Random();

    while (transactionId.length < maxTransactionIdLength) {
      transactionId += allowedCharacters[random.nextInt(allowedCharacters.length)];
    }

    return transactionId;
  }
}
