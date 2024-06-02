import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/features/orders/data/constants/enums.dart';
import 'package:moomalpublication/features/orders/data/constants/type_alias.dart';
import 'package:moomalpublication/features/orders/data/models/order_response_model1/order_response_model1.dart';
import 'package:moomalpublication/features/orders/data/services/get_orders_services.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';

class OrderController extends BaseController {
  final Rx<OrderResponse> orderResponse = Rx(ApiResponse());
  final RxBool showBrowseProduct = true.obs;
  final RxList<OrderResponseModel1> ordersList = RxList<OrderResponseModel1>([]);
  final Rx<OrderResponseModel1> singleProduct = Rx(OrderResponseModel1());
  Rx<OrdersMainTabType> selectedMainTestType = Rx(OrdersMainTabType.ebook);

  RxList<OrderResponseModel1> ebookPurchase = RxList();
  RxList<OrderResponseModel1> bookPurchase = RxList();
  RxList<OrderResponseModel1> testSeries = RxList();

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


  void onMainTabsClick(OrdersMainTabType orderMainTabType) {
    selectedMainTestType.value = orderMainTabType;

    switch (orderMainTabType) {
      case OrdersMainTabType.ebook:
        ebookPurchase = _getList();
        ordersList.value = ebookPurchase;
      case OrdersMainTabType.book:
        bookPurchase = _getList();
        ordersList.value = bookPurchase;
      case OrdersMainTabType.test:
        testSeries = _getList();
        ordersList.value = testSeries;
    }
    ordersList.refresh();
  }

  RxList<OrderResponseModel1> _getList() {
    return ordersList;
  }
}
