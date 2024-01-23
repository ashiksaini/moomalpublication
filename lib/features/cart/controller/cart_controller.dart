import 'package:get/get.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/core/libs/payu_sdk/payu_checkout_pro.dart';
import 'package:moomalpublication/core/utils/snackbar.dart';
import 'package:moomalpublication/features/cart/data/constants/type_alias.dart';
import 'package:moomalpublication/features/cart/data/models/cart_data/item.dart';
import 'package:moomalpublication/features/cart/data/models/cart_data/totals.dart';
import 'package:moomalpublication/features/cart/data/services/cart_services.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';

class CartController extends BaseController {
  final Rx<CartDataResponse> cartDataResponse = Rx(ApiResponse());
  final Rx<CartCheckoutResponse> cartCheckoutResponse = Rx(ApiResponse());

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

  Future<void> onRefresh() async {
    cartItems.clear();
    totals.value = null;
    _getCartData();
  }

  Future<void> onDesc(Item cartItem) async {
    int quantity = cartItem.quantity ?? 0;
    --quantity;

    if (quantity == 0) {
      onDeleteItem(cartItem);
    } else {
      cartDataResponse.value = await CartServices.updateItem(
          id: cartItem.id.toString(),
          quantity: quantity.toString(),
          key: cartItem.key);
      if (cartDataResponse.value.data != null) {
        if (cartDataResponse.value.data!.items != null &&
            cartDataResponse.value.data!.items!.isNotEmpty) {
          cartItems.value = cartDataResponse.value.data!.items!;
          totals.value = cartDataResponse.value.data!.totals!;
        }
      }
    }
  }

  Future<void> onInc(Item cartItem) async {
    int quantity = cartItem.quantity ?? 0;
    ++quantity;

    if (quantity == 9999) {
      showSnackBar("quantity_cannot_exceed_the_limit".tr);
    } else {
      cartDataResponse.value = await CartServices.updateItem(
          id: cartItem.id.toString(),
          quantity: quantity.toString(),
          key: cartItem.key);
      if (cartDataResponse.value.data != null) {
        if (cartDataResponse.value.data!.items != null &&
            cartDataResponse.value.data!.items!.isNotEmpty) {
          cartItems.value = cartDataResponse.value.data!.items!;
          totals.value = cartDataResponse.value.data!.totals!;
        }
      }
    }
  }

  Future<void> onDeleteItem(Item cartItem) async {
    cartDataResponse.value = await CartServices.removeItem(
        id: cartItem.id.toString(), key: cartItem.key);
    if (cartDataResponse.value.data != null) {
      if (cartDataResponse.value.data!.items != null) {
        cartItems.value = cartDataResponse.value.data!.items!;
        totals.value = cartDataResponse.value.data!.totals!;
      }
    }
  }

  void cartCheckout() async {
    cartCheckoutResponse.value = ApiResponse.loading();

    cartCheckoutResponse.value = await CartServices.checkout();
    if (cartCheckoutResponse.value.data != null) {
      final PayUCheckoutPro payUCheckoutPro = PayUCheckoutPro();
      payUCheckoutPro.init();
      payUCheckoutPro.pay(totals.value?.totalPrice, cartCheckoutResponse.value.data!.orderKey);
    }
  }
}
