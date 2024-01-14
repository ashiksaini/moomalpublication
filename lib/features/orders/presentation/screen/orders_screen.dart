import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
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
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppbar(
              prefixIcon: AppAssets.icBackArrow,
              onPrefixIconClick: () => AppRouting.navigateBack(),
              title: 'orders'.tr,
              maxLine: 1,
            ),
             Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [OrderCard()],
                ),
              ),
            ),
            // const EmptyCartView(title: "title"),
          ],
        ),
      ),
    );
  }
}
