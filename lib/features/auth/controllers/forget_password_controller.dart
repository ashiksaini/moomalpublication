import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/core/constants/app_constants.dart';
import 'package:moomalpublication/core/utils/toast.dart';import 'package:moomalpublication/features/auth/data/constants/type_alias.dart';
import 'package:moomalpublication/features/auth/data/services/reset_password_services.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';

class ForgetPasswordController extends BaseController {
  final Rx<ResetPasswordResponse> resetPasswordResponse =
      Rx(ResetPasswordResponse());

  Future<void> onResetPasswordClick() async {
    if (super.isValidEmail()) {
      resetPasswordResponse.value = ApiResponse.loading();
      resetPasswordResponse.value =
          await ResetPasswordServices.resetPassword(data: _getCredential());

      if (resetPasswordResponse.value.data != null) {
        if (resetPasswordResponse.value.data!.status!
                .compareTo(AppConstants.successfulResponse) ==
            0) {
          _navigateResetPasswordOnSuccessScreen();
        } else {
          showToast(resetPasswordResponse.value.data!.message.toString());
        }
      } else {
        showToast(AppConstants.somethingWentWrong);
      }
    }
  }

  Map<String, String> _getCredential() {
    return {
      "email": emailTextEditingController.text,
    };
  }

  void _navigateResetPasswordOnSuccessScreen() {
    AppRouting.offNamed(NameRoutes.resetPasswordOnSuccessScreen);
  }
}
