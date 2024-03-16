import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/core/constants/app_constants.dart';
import 'package:moomalpublication/core/utils/toast.dart';
import 'package:moomalpublication/features/thank_you_page/data/constants/type_alias.dart';
import 'package:moomalpublication/features/thank_you_page/data/models/order_succes_response/order_succes_response.dart';
import 'package:moomalpublication/features/thank_you_page/data/services/order_succes_response.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';

class OrderSuccessController extends BaseController {
  final Rx<OrderSuccessResponseData> orderSuccessResponse =
      Rx(OrderSuccessResponseData());
  Rx<OrderSuccessResponse> orderSuccessData = Rx(OrderSuccessResponse());
  RxBool thankYouScreeShow = RxBool(true);

  @override
  void onInit() async {
    super.onInit();
    _getOrderSuccesResponse();
  }

  Future<void> _getOrderSuccesResponse() async {
    orderSuccessResponse.value = ApiResponse.loading();
    orderSuccessResponse.value =
        await OrderSuccessService.getOrderSuccessDetails();

    if (orderSuccessResponse.value.data != null) {
      await Future.delayed(const Duration(seconds: 2));
      thankYouScreeShow.value = false;
      orderSuccessData.value = orderSuccessResponse.value.data!;
    } else {
      showToast(AppConstants.somethingWentWrong);
    }
  }
}
