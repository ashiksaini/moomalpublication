import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/core/constants/app_constants.dart';
import 'package:moomalpublication/core/utils/snackbar.dart';
import 'package:moomalpublication/core/utils/toast.dart';
import 'package:moomalpublication/core/utils/utility.dart';
import 'package:moomalpublication/features/auth/data/constants/type_alias.dart';
import 'package:moomalpublication/features/auth/data/services/login_services.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';
import 'package:moomalpublication/services/storage/shared_preferences_helper.dart';
import 'package:moomalpublication/services/storage/shared_preferences_keys.dart';

class LoginController extends BaseController {
  final Rx<LoginResponse> loginResponse = Rx(LoginResponse());
  final RxBool rememberMe = RxBool(false);

  @override
  void onInit() {
    super.onInit();

    _checkForRememberMe();
  }

  Future<void> onLogin() async {
    if (super.isCredentialValid()) {
      loginResponse.value = ApiResponse.loading();
      loginResponse.value = await LoginServices.login(data: _getCredential());

      if (loginResponse.value.data != null) {
        if (loginResponse.value.data!.status!
                .compareTo(AppConstants.successfulResponse) ==
            0) {
          await Utility.saveLoginDataToLocal(loginResponse.value.data!.data!,
              rememberMe.value, passwordTextEditingController.text);
          _navigateToHomeScreen();
        } else {
          showSnackBar(loginResponse.value.data!.message.toString());
        }
      } else {
        CustomToast.showToast(AppConstants.somethingWentWrong);
      }
    }
  }

  Map<String, String> _getCredential() {
    return {
      "username": usernameTextEditingController.text,
      "password": passwordTextEditingController.text,
    };
  }

  void _navigateToHomeScreen() {
    AppRouting.offAllNamed(NameRoutes.moomalpublicationApp);
  }

  void _checkForRememberMe() async {
    if (await SharedPreferencesHelper.getBool(
        SharedPreferenceKeys.rememberMe)) {
      usernameTextEditingController.text =
          await SharedPreferencesHelper.getString(
                  SharedPreferenceKeys.username) ??
              "";
      passwordTextEditingController.text =
          await SharedPreferencesHelper.getString(
                  SharedPreferenceKeys.password) ??
              "";
    }
  }
}
