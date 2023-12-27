import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/libs/payu_sdk/payu_checkout_pro.dart';
import 'package:moomalpublication/core/theme/box_shadows.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/cart/controller/cart_controller.dart';
import 'package:moomalpublication/features/cart/presentation/templates/card_card.dart';
import 'package:moomalpublication/features/cart/presentation/widgets/order_details.dart';
import 'package:moomalpublication/features/cart/presentation/widgets/shadow_container.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final CartController _cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Appbar
            CustomAppbar(title: "my_cart".tr),

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
  }

  Widget _getPlaceOrderView(BuildContext context) {
    return Container(
      width: screenWidth(context),
      padding: EdgeInsets.only(
        left: scaleWidth(15, context),
        right: scaleWidth(10, context),
        top: scaleHeight(10, context),
        bottom: scaleHeight(10, context),
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
          GestureDetector(
            onTap: () {
              print("object");
              final PayUCheckoutPro payUCheckoutPro = PayUCheckoutPro();
              payUCheckoutPro.init();
              payUCheckoutPro.pay();
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: scaleHeight(10, context),
                horizontal: scaleWidth(24, context),
              ),
              decoration: BoxDecoration(
                color: AppColors.green,
                borderRadius: BorderRadius.circular(scaleRadius(10, context)),
              ),
              child: CustomText(
                text: 'place_order'.tr,
                textStyle: CustomTextStyle.textStyle20Bold(context,
                    color: AppColors.white),
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
        horizontal: scaleWidth(10, context),
        vertical: scaleHeight(10, context),
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
        horizontal: scaleWidth(10, context),
        vertical: scaleHeight(10, context),
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

/**
 const VerticalGap(size: 32),
                      ShadowContainer(
                        containerChild: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: scaleWidth(20, context), top: scaleWidth(14, context)),
                              child: CustomText(
                                text: "Popular Books",
                                textStyle: CustomTextStyle.textStyle20Bold(
                                  context,
                                ),
                              ),
                            ),
                            const CartCard(
                              addButton: true,
                            ),
                            const CartCard(
                              addButton: true,
                            ),
                          ],
                        ),
                      ),
 */
