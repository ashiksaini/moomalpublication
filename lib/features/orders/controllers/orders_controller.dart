import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/features/orders/data/constants/enums.dart';
import 'package:moomalpublication/features/orders/data/constants/type_alias.dart';
import 'package:moomalpublication/features/orders/data/models/order_response_model.dart';
import 'package:moomalpublication/features/orders/data/services/get_orders_services.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';

class OrderController extends BaseController {
  final Rx<OrderResponse> orderResponse = Rx(ApiResponse());
  final RxBool showBrowseProduct = true.obs;
  RxList<OrderResponseModel> ordersList = RxList<OrderResponseModel>([]);

  final Rx<OrderResponseModel> singleProduct = Rx(OrderResponseModel());

  @override
  void onInit() {
    super.onInit();
    getOrders();
  }

  void getOrders() async {
    orderResponse.value = ApiResponse.loading();
    orderResponse.value = await GetOrderService.getOrders();
    if (orderResponse.value.data != null) {
      ordersList.value = orderResponse.value.data!;
      showBrowseProduct.value = true;
    } else {
      showBrowseProduct.value = false;
    }
  }

  Rx<OrdersMainTabType> selectedMainTestType = Rx(OrdersMainTabType.ebook);

  RxList<OrderResponseModel> ebookPurchase = RxList();
  RxList<OrderResponseModel> bookPurchase = RxList();
  RxList<OrderResponseModel> testSeries = RxList();

  void onMainTabsClick(OrdersMainTabType orderMainTabType) {
    selectedMainTestType.value = orderMainTabType;

    switch (orderMainTabType) {
      case OrdersMainTabType.ebook:
        ebookPurchase = _getList();
        ordersList = ebookPurchase;
      case OrdersMainTabType.book:
        bookPurchase = _getList();
        ordersList = bookPurchase;
      case OrdersMainTabType.test:
        testSeries = _getList();
        ordersList = testSeries;
    }
    ordersList.refresh();
  }

  RxList<OrderResponseModel> _getList() {
    return ordersList;
  }
}
