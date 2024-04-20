import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/no_glow_behaviour.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/cart/presentation/widgets/shadow_container.dart';
import 'package:moomalpublication/features/my_orders/presentation/template/order_detail_card.dart';
import 'package:moomalpublication/features/my_orders/presentation/template/product_detail.dart';
import 'package:moomalpublication/features/my_orders/presentation/template/shipping_detail_card.dart';
import 'package:moomalpublication/features/orders/controllers/orders_controller.dart';
import 'package:moomalpublication/features/orders/data/models/order_response_model.dart';
import 'package:moomalpublication/features/orders/data/models/shipping.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';

class EbookOrderScreen extends StatelessWidget {
  EbookOrderScreen({super.key});
  final OrderController orderController = Get.find<OrderController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Container(
          color: AppColors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppbar(
                title: 'ebook_order'.tr,
                prefixIcon: AppAssets.icBackArrow,
                onPrefixIconClick: () => AppRouting.navigateBack(),
                suffixIcon: AppAssets.icSearch,
                onSuffixIconClick: () =>
                    AppRouting.toNamed(NameRoutes.searchScreen),
              ),
              const VerticalGap(size: 14),
              ScrollConfiguration(
                behavior: NoGlowBehavior(),
                child: Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6.h),
                          child: CustomText(
                              text: 'product_details'.tr,
                              textStyle: CustomTextStyle.textStyle15Bold(
                                  context,
                                  color: AppColors.black)),
                        ),
                        const VerticalGap(size: 12),
                        ScrollConfiguration(
                          behavior: NoGlowBehavior(),
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: orderController
                                          .singleProduct.value.lineItems !=
                                      null
                                  ? orderController
                                      .singleProduct.value.lineItems!.length
                                  : 0,
                              itemBuilder: (context, index) {
                                return ProductDetailCard(
                                  orderResponseModel:
                                      orderController.singleProduct.value,
                                  lineItem: orderController
                                              .singleProduct.value.lineItems !=
                                          null
                                      ? orderController
                                          .singleProduct.value.lineItems![index]
                                      : LineItem(),
                                  datePaid: orderController
                                      .singleProduct.value.datePaid
                                      .toString(),
                                );
                              }),
                        ),
                        const Divider(height: 1),
                        const VerticalGap(size: 12),
                        OrderDetailCard(
                          lineItem:
                              orderController.singleProduct.value.lineItems !=
                                          null &&
                                      orderController.singleProduct.value
                                          .lineItems!.isNotEmpty
                                  ? orderController
                                      .singleProduct.value.lineItems![0]
                                  : LineItem(),
                        ),
                        ShippingDetailCard(
                            shipping:
                                orderController.singleProduct.value.lineItems !=
                                            null &&
                                        orderController.singleProduct.value
                                            .lineItems!.isNotEmpty
                                    ? orderController
                                            .singleProduct.value.shippingData ??
                                        Shipping()
                                    : Shipping()),
                        // Padding(
                        //   padding: EdgeInsets.symmetric(
                        //       vertical: 20.v, horizontal: 14.h),
                        //   child: ShadowContainer(
                        //       borderColor: AppColors.white,
                        //       backgroundColor: AppColors.orange,
                        //       borderRadius: 10,
                        //       containerChild: Padding(
                        //         padding: EdgeInsets.symmetric(vertical: 12.h),
                        //         child: Row(
                        //           mainAxisAlignment: MainAxisAlignment.center,
                        //           children: [
                        //             CustomText(
                        //                 text: 'order_again'.tr,
                        //                 textStyle:
                        //                     CustomTextStyle.textStyle22Bold(
                        //                         context,
                        //                         color: AppColors.black)),
                        //           ],
                        //         ),
                        //       )),
                        // )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
