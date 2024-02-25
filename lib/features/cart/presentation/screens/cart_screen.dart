import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:moomalpublication/core/components/atoms/custom_progress_indicator.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/components/atoms/refersh_indicator.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/components/organisms/empty_cart_view.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/box_shadows.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/cart/controller/cart_controller.dart';
import 'package:moomalpublication/features/cart/presentation/template/card_card.dart';
import 'package:moomalpublication/features/cart/presentation/widgets/order_details.dart';
import 'package:moomalpublication/features/cart/presentation/widgets/shadow_container.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartController _cartController = Get.put(CartController());

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _cartController.onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Obx(() {
          return CustomRefreshIndicator(
            onRefreshCallback: () => _cartController.onRefresh(),
            child: Container(
              color: AppColors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Appbar
                  CustomAppbar(title: "my_cart".tr),

                  if (_cartController.cartDataResponse.value.isLoading) ...{
                    // Show Loading
                    Expanded(
                      child: Center(
                        child: customProgressIndicator(),
                      ),
                    ),
                  } else if (_cartController.cartItems.isEmpty) ...{
                    // Show Empty View
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          EmptyCartView(title: "no_items_in_cart".tr),
                        ],
                      ),
                    )
                  } else
                    // Cart view
                    Expanded(
                      child: Stack(
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _getCartView(context),
                                const VerticalGap(size: 30),
                                _getOrderDetailView(context),
                                const VerticalGap(size: 80),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: _getPlaceOrderView(context),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _getPlaceOrderView(BuildContext context) {
    return Container(
      width: SizeUtils.width,
      padding: EdgeInsets.only(
        left: 15.h,
        right: 10.h,
        top: 10.v,
        bottom: 10.v,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [primaryBoxShadow()],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: "₹${_cartController.totals.value?.totalPrice ?? ""}",
            textStyle: CustomTextStyle.textStyle25Bold(context),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.green,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: _cartController.cartCheckoutResponse.value.isLoading
                ? Container(
                    height: 45.h,
                    padding: EdgeInsets.symmetric(
                        horizontal: 45.h),
                    child: LottieBuilder.asset(
                      AppAssets.loadingAnimation,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                      height: 45.h,
                    ),
                  )
                : GestureDetector(
                    onTap: () => _cartController.cartCheckout(),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.v,
                        horizontal: 24.h,
                      ),
                      child: CustomText(
                        text: 'place_order'.tr,
                        textStyle: CustomTextStyle.textStyle20Bold(context,
                            color: AppColors.white),
                      ),
                    ),
                  ),
          )
        ],
      ),
    );
  }

  Widget _getOrderDetailView(BuildContext context) {
    return ShadowContainer(
      margin: EdgeInsets.symmetric(
        horizontal: 10.h,
        vertical: 10.v,
      ),
      containerChild: OrderDetails(
        totals: _cartController.totals.value!,
        totalItems: _cartController.cartItems.length,
      ),
    );
  }

  Widget _getCartView(BuildContext context) {
    return ShadowContainer(
      margin: EdgeInsets.symmetric(
        horizontal: 10.h,
        vertical: 10.v,
      ),
      containerChild: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _cartController.cartItems.length,
        itemBuilder: (_, index) {
          return CartCard(
            cartItem: _cartController.cartItems[index],
            isLast: (index != _cartController.cartItems.length - 1),
            quantityButton: true,
          );
        },
      ),
    );
  }
}
