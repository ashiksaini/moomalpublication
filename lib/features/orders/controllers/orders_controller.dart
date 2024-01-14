import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/features/orders/data/constants/type_alias.dart';
import 'package:moomalpublication/features/orders/data/models/order_response_model.dart';
import 'package:moomalpublication/features/orders/data/services/get_orders_services.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';

class OrderController extends BaseController {
  final Rx<OrderResponse> orderResponse = Rx(ApiResponse());
  final RxBool showBrowseProduct = true.obs;
  final RxList<OrderResponseModel> ordersList = RxList<OrderResponseModel>([]);

  @override
  void onInit() {
    super.onInit();
    getOrders();
  }

  void getOrders() async {
    orderResponse.value = ApiResponse.loading();
    orderResponse.value = await GetOrderService.getOrders(id: '8686');
    if (orderResponse.value.data != null) {
      ordersList.value = orderResponse.value.data!;
      showBrowseProduct.value = true;
    } else {
      showBrowseProduct.value = false;
    }
  }
}
