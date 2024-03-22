import 'package:get/get.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/core/constants/app_constants.dart';
import 'package:moomalpublication/core/utils/toast.dart';
import 'package:moomalpublication/features/subscribe/data/constants/type_alias.dart';
import 'package:moomalpublication/features/subscribe/data/services/subscribe_services.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';
import 'package:moomalpublication/services/storage/shared_preferences_helper.dart';
import 'package:moomalpublication/services/storage/shared_preferences_keys.dart';

class SubscribeController extends BaseController {
  String email = "";
  final Rx<SubscribeResponse> subscribeResponse = Rx(SubscribeResponse());

  @override
  void onInit() async {
    super.onInit();

    email =
        await SharedPreferencesHelper.getString(SharedPreferenceKeys.email) ??
            "";
  }

  void onSubscribe() async {
    subscribeResponse.value = ApiResponse.loading();
    subscribeResponse.value = await SubscribeService.subscribe(email);

    if (subscribeResponse.value.data != null) {
      showToast("news_letter_subscribed_successfully".tr);
    } else {
      showToast(AppConstants.somethingWentWrong);
    }
  }
}
