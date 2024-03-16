import 'package:get/get.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/core/utils/toast.dart';
import 'package:moomalpublication/features/settings/data/constant/type_alias.dart';
import 'package:moomalpublication/features/settings/data/services/setting_services.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';
import 'package:moomalpublication/services/storage/shared_preferences_helper.dart';

class SettingController extends BaseController {
  final Rx<DeleteAccountResponse> deleteAccountResponse = Rx(ApiResponse());

  void navigateSettingDetailScreen({
    required String appBarTitle,
    required String description,
  }) {
    AppRouting.toNamed(
      NameRoutes.settingDetailScreen,
      argument: [
        {"appBarTitle": appBarTitle},
        {"description": description},
      ],
    );
  }

  Future<void> deleteUserAccount() async {
    deleteAccountResponse.value = ApiResponse.loading();
    deleteAccountResponse.value = await SettingsServices.deleteAccount();

    if (deleteAccountResponse.value.data != null) {
      showToast('account_deleted_successfully'.tr);
      SharedPreferencesHelper.clearSharedPref();
      AppRouting.offAllNamed(NameRoutes.splashScreen);
    }
  }
}
