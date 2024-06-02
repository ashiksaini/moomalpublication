import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/features/orders/data/constants/enums.dart';
import 'package:moomalpublication/features/orders/data/constants/type_alias.dart';
import 'package:moomalpublication/features/orders/data/models/order_response_model1/order_response_model1.dart';
import 'package:moomalpublication/features/orders/data/services/get_orders_services.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';

import '../data/models/order_response_model1/line_item.dart';

class OrderController extends BaseController {
  final Rx<OrderResponse> orderResponse = Rx(ApiResponse());
  final RxBool showBrowseProduct = true.obs;
  final RxList<OrderResponseModel1> ordersList =
      RxList<OrderResponseModel1>([]);

  final Rx<LineItem> singleProduct = Rx(LineItem());
  final Rx<OrdersMainTabType> selectedMainTestType =
      Rx(OrdersMainTabType.ebook);
  final RxList<LineItem> ebookPurchase = RxList();
  final RxList<LineItem> bookPurchase = RxList();
  final RxList<LineItem> testSeries = RxList();

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

      parseOrderList();
    } else {
      showBrowseProduct.value = false;
    }
  }

  void onMainTabsClick(OrdersMainTabType orderMainTabType) {
    selectedMainTestType.value = orderMainTabType;
    ordersList.refresh();
  }

  void parseOrderList() {
    _parseEBookSeries();
    _parseTestSeries();
    _parseBookSeries();
  }

  void _parseTestSeries() {
    for (OrderResponseModel1 order in ordersList) {
      if (order.status?.toLowerCase().compareTo("completed") == 0 &&
          order.lineItems?.isNotEmpty == true) {
        for (LineItem lineItem in order.lineItems ?? []) {
          if (lineItem.productId?.toLowerCase().compareTo("5772") == 0) {
            lineItem.status = order.status;
            lineItem.datePaid = order.datePaid;
            lineItem.billing = order.billing;
            lineItem.shipping = order.shipping;
            lineItem.ordersMainTabType = OrdersMainTabType.test;

            testSeries.add(lineItem);
          }
        }
      }
    }
  }

  void _parseBookSeries() {
    for (int i = 0; i < ordersList.length; i++) {
      OrderResponseModel1? order = ordersList.elementAtOrNull(i);

      if ((order?.status?.toLowerCase().compareTo("processing") == 0 ||
              order?.status?.toLowerCase().compareTo("completed") == 0) &&
          order?.lineItems?.isNotEmpty == true) {
        for (int j = 0; j < (order?.lineItems?.length ?? 0); j++) {
          LineItem? lineItem = order?.lineItems?.elementAtOrNull(j);

          if (lineItem != null &&
              (lineItem.metaData
                          ?.elementAtOrNull(0)
                          ?.value
                          ?.toLowerCase()
                          .compareTo("book") ==
                      0 ||
                  lineItem.metaData
                          ?.elementAtOrNull(1)
                          ?.value
                          ?.toLowerCase()
                          .compareTo("book") ==
                      0)) {
            lineItem.status = order?.status;
            lineItem.datePaid = order?.datePaid;
            lineItem.billing = order?.billing;
            lineItem.shipping = order?.shipping;
            lineItem.ordersMainTabType = OrdersMainTabType.book;

            bookPurchase.add(lineItem);
          }
        }
      }
    }
  }

  void _parseEBookSeries() {
    for (int i = 0; i < ordersList.length; i++) {
      OrderResponseModel1? order = ordersList.elementAtOrNull(i);

      if ((order?.status?.toLowerCase().compareTo("processing") == 0 ||
              order?.status?.toLowerCase().compareTo("completed") == 0) &&
          order?.lineItems?.isNotEmpty == true &&
          order?.downloadLinks?.isNotEmpty == true) {
        for (int j = 0; j < (order?.lineItems?.length ?? 0); j++) {
          LineItem? lineItem = order?.lineItems?.elementAtOrNull(j);

          if (lineItem != null &&
              (lineItem.metaData
                          ?.elementAtOrNull(0)
                          ?.value
                          ?.toLowerCase()
                          .compareTo("ebook") ==
                      0 ||
                  lineItem.metaData
                          ?.elementAtOrNull(1)
                          ?.value
                          ?.toLowerCase()
                          .compareTo("ebook") ==
                      0)) {
            lineItem.status = order?.status;
            lineItem.link = order?.downloadLinks?.elementAtOrNull(j);
            lineItem.datePaid = order?.datePaid;
            lineItem.billing = order?.billing;
            lineItem.shipping = order?.shipping;
            lineItem.ordersMainTabType = OrdersMainTabType.ebook;

            ebookPurchase.add(lineItem);
          }
        }
      }
    }
  }
}



/**
 * 
 {payuResponse: {"result":{"mihpayid":20044042762,"mode":"UPI","status":"success","key":"MyHd2S","txnid":"wc_order_O5aRF4GyApKQq","amount":"1.00","addedon":"2024-06-02 17:49:06","productinfo":"Moomal Publication","firstname":"Moomal Publication","lastname":"","address1":"","address2":"","city":"","state":"","country":"","zipcode":"","email":"moomalpublication@gmail.com","phone":"6350446154","udf1":"","udf2":"","udf3":"","udf4":"","udf5":"","udf6":"","udf7":"","udf8":"","udf9":"","udf10":"","card_token":"","card_no":"","field0":"","field1":"","field2":"653417","field3":"9982696197@ybl","field4":"","field5":"moomalprakashan-8063907.payu@indus","field6":"PPPL20044042762020624174906","field7":"APPROVED OR COMPLETED SUCCESSFULLY|00","field8":"phonepe","field9":"Success|Completed Using Callback","payment_source":"payuPureS2S","PG_TYPE":"UPI-PG","error":"E000","error_Message":"No Error","net_amount_debit":1,"discount":"0.00","offer_key":null,"offer_availed":null,"unmappedstatus":"captured","hash":"51330
 */