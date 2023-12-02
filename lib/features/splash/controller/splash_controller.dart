import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';
import 'package:moomalpublication/services/storage/shared_preferences_helper.dart';
import 'package:moomalpublication/services/storage/shared_preferences_keys.dart';

class SplashController extends BaseController {
  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(seconds: 3), () => _checkIsLoggedIn());
  }

  Future<void> _checkIsLoggedIn() async {
    final bool isLoggedIn = await SharedPreferencesHelper.getBool(SharedPreferenceKeys.isLogin);

    if (isLoggedIn) {
      _navigateToHomeScreen();
    } else {
      _navigateSignInScreen();
    }
  }

  void _navigateSignInScreen() {
    AppRouting.offAllNamed(NameRoutes.signinScreen);
  }

  void _navigateToHomeScreen() {
    AppRouting.offAllNamed(NameRoutes.moomalpublicationApp);
  }
}
