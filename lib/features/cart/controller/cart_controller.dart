import 'package:get/get.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/features/cart/data/constants/type_alias.dart';
import 'package:moomalpublication/features/cart/data/models/cart_data/item.dart';
import 'package:moomalpublication/features/cart/data/models/cart_data/totals.dart';
import 'package:moomalpublication/features/cart/data/services/cart_services.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';

class CartController extends BaseController {
  final Rx<CartDataResponse> cartDataResponse = Rx(ApiResponse());
  final RxList<Item> cartItems = RxList();
  final Rx<Totals?> totals = Rx(null);

  @override
  void onInit() {
    super.onInit();

    _getCartData();
  }

  Future<void> _getCartData() async {
    cartDataResponse.value = ApiResponse.loading();

    cartDataResponse.value = await CartServices.getCartProducts();
    if (cartDataResponse.value.data != null) {
      if (cartDataResponse.value.data!.items != null &&
          cartDataResponse.value.data!.items!.isNotEmpty) {
        cartItems.addAll(cartDataResponse.value.data!.items!);
        totals.value = cartDataResponse.value.data!.totals!;
      }
    }
  }
}
