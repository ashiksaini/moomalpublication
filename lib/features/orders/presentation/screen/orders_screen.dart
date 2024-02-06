import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_progress_indicator.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/components/organisms/empty_cart_view.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/features/orders/controllers/orders_controller.dart';
import 'package:moomalpublication/features/orders/presentation/template/order_card.dart';
import 'package:moomalpublication/routes/routing.dart';

class OrdersScreen extends StatelessWidget {
  OrdersScreen({super.key});
  final OrderController orderController = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Container(
          color: AppColors.white,
          child: Column(
            children: [
              CustomAppbar(
                prefixIcon: AppAssets.icBackArrow,
                onPrefixIconClick: () => AppRouting.navigateBack(),
                title: 'orders'.tr,
                maxLine: 1,
              ),
              Obx(
                () => Expanded(
                  child: orderController.orderResponse.value.isLoading
                      ? Center(child: customProgressIndicator())
                      : orderController.showBrowseProduct.value
                          ? SingleChildScrollView(
                              child: Column(
                                children: [OrderCard()],
                              ),
                            )
                          : Center(child: EmptyCartView(title: "title".tr)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
