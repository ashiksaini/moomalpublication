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
import 'package:moomalpublication/features/orders/controllers/orders_controller.dart';
import 'package:moomalpublication/features/orders/data/models/shipping.dart';
import 'package:moomalpublication/routes/routing.dart';

import '../template/order_detail_card.dart';
import '../template/product_detail.dart';
import '../template/shipping_detail_card.dart';

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
                title: 'order_details'.tr,
                prefixIcon: AppAssets.icBackArrow,
                onPrefixIconClick: () => AppRouting.navigateBack(),
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
                          child: ProductDetailCard(
                            lineItem: orderController.singleProduct.value,
                            datePaid: orderController
                                .singleProduct.value.datePaid
                                .toString(),
                          ),
                        ),
                        const Divider(height: 1),
                        const VerticalGap(size: 12),
                        OrderDetailCard(
                          lineItem: orderController.singleProduct.value,
                        ),
                        ShippingDetailCard(
                            shipping:
                                orderController.singleProduct.value.shipping ??
                                    Shipping()),
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
