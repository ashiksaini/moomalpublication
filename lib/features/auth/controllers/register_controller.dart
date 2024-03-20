import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/core/constants/app_constants.dart';
import 'package:moomalpublication/core/utils/toast.dart';
import 'package:moomalpublication/core/utils/utility.dart';
import 'package:moomalpublication/features/auth/data/constants/type_alias.dart';
import 'package:moomalpublication/features/auth/data/services/register_services.dart';
import 'package:moomalpublication/routes/routing.dart';
import 'package:moomalpublication/services/network/api_paths.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';

class RegisterController extends BaseController {
  final Rx<RegisterUserResponse> userRegisterResponse =
      Rx(RegisterUserResponse());

  Future<void> onRegister() async {
    if (super.isCredentialValid() && super.isValidEmail()) {
      userRegisterResponse.value = ApiResponse.loading();
      userRegisterResponse.value =
          await RegisterUserServices.register(data: _getCredential());

      if (userRegisterResponse.value.data != null) {
        if (userRegisterResponse.value.data!.status!
                .compareTo(AppConstants.successfulResponse) ==
            0) {
          showToast(userRegisterResponse.value.data!.message.toString());
          Future.delayed(
              const Duration(seconds: 4), () => _navigateToLoginScreen());
        } else {
          showToast(userRegisterResponse.value.data!.message.toString());
        }
      } else {
        showToast(AppConstants.somethingWentWrong);
      }
    }
  }

  void onPrivacyPolicyClick() {
    Utility.launchurl(ApiPaths.privacyPolicy);
  }

  void _navigateToLoginScreen() {
    AppRouting.navigateBack();
  }

  Map<String, String> _getCredential() {
    return {
      "username": usernameTextEditingController.text,
      "email": emailTextEditingController.text,
      "password": passwordTextEditingController.text,
    };
  }
}
