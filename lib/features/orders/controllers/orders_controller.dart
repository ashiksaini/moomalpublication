import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/features/orders/data/constants/type_alias.dart';
import 'package:moomalpublication/features/orders/data/models/order_response_model1/order_response_model1.dart';
import 'package:moomalpublication/features/orders/data/services/get_orders_services.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';

class OrderController extends BaseController {
  final Rx<OrderResponse> orderResponse = Rx(ApiResponse());
  final RxBool showBrowseProduct = true.obs;
  final RxList<OrderResponseModel1> ordersList = RxList<OrderResponseModel1>([]);
  final Rx<OrderResponseModel1> singleProduct = Rx(OrderResponseModel1());

  @override
  void onInit() {
    super.onInit();
    getOrders();
  }

  void getOrders() async {
    orderResponse.value = ApiResponse.loading();
    orderResponse.value = await GetOrderService.getOrders();
    if (orderResponse.value.data != null) {
      ordersList.value = orderResponse.value.data!.where((element) => (element.status?.compareTo("completed") == 0 || element.status?.compareTo("processing") == 0)).toList();
      showBrowseProduct.value = true;
    } else {
      showBrowseProduct.value = false;
    }
  }
}
