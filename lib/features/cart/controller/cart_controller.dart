import 'package:get/get.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/core/utils/shared_data.dart';
import 'package:moomalpublication/core/utils/toast.dart';
import 'package:moomalpublication/features/cart/data/constants/type_alias.dart';
import 'package:moomalpublication/features/cart/data/models/cart_data/item.dart';
import 'package:moomalpublication/features/cart/data/models/cart_data/totals.dart';
import 'package:moomalpublication/features/cart/data/services/cart_services.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';
import 'package:moomalpublication/services/storage/shared_preferences_helper.dart';
import 'package:moomalpublication/services/storage/shared_preferences_keys.dart';

class CartController extends BaseController {
  final Rx<CartDataResponse> cartDataResponse = Rx(ApiResponse());
  final Rx<CartCheckoutResponse> cartCheckoutResponse = Rx(ApiResponse());

  final RxList<Item> cartItems = RxList();
  final Rx<Totals?> totals = Rx(null);
  late final Function? _onCartItemCountChange;

  CartController({Function? onCartItemCountChange}) {
    _onCartItemCountChange = onCartItemCountChange;
  }

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
        cartItems.clear();
        totals.value = null;
        cartItems.addAll(cartDataResponse.value.data!.items!);
        totals.value = cartDataResponse.value.data!.totals!;
        _onCartItemCountChange!(cartItems.length);
      }
    }
  }

  Future<void> onRefresh() async {
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
          _onCartItemCountChange!(cartItems.length);
        }
      }
    }
  }

  Future<void> onInc(Item cartItem) async {
    if (cartItem.id?.compareTo("5772") == 0) {
      showErrorToast("test_quantity_cannot_be_more_than_one".tr);
    } else {
      if (cartItem.variation
              ?.elementAtOrNull(0)
              ?.value
              ?.toLowerCase()
              .compareTo("ebook") ==
          0) {
        showErrorToast("ebook_quantity_cannot_be_more_than_one".tr);
      } else {
        int quantity = cartItem.quantity ?? 0;
        ++quantity;

        if (quantity == 9999) {
          showToast("quantity_cannot_exceed_the_limit".tr);
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
              _onCartItemCountChange!(cartItems.length);
            }
          }
        }
      }
    }
  }

  Future<void> onDeleteItem(Item cartItem) async {
    cartDataResponse.value = await CartServices.removeItem(
        id: cartItem.id.toString(), key: cartItem.key);
    if (cartDataResponse.value.data != null) {
      if (cartDataResponse.value.data!.items != null) {
        await SharedPreferencesHelper.remove(SharedPreferenceKeys.examId);
        await SharedPreferencesHelper.remove(SharedPreferenceKeys.examPrice);
        cartItems.value = cartDataResponse.value.data!.items!;
        totals.value = cartDataResponse.value.data!.totals!;
        _onCartItemCountChange!(cartItems.length);
      }
    }
  }

  void cartCheckout() async {
    cartCheckoutResponse.value = ApiResponse.loading();

    cartCheckoutResponse.value = await CartServices.checkout();
    if (cartCheckoutResponse.value.data != null) {
      AppRouting.toNamed(
        NameRoutes.addressesScreen,
        argument: SharedData(
          onCartCallBack: onRefresh,
          totalPrice: totals.value?.totalPrice,
          orderId: cartCheckoutResponse.value.data!.orderId.toString(),
          orderKey: cartCheckoutResponse.value.data!.orderId.toString(),
        ),
      );
    }
  }
}
