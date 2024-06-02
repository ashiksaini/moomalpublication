import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_progress_indicator.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/components/organisms/empty_cart_view.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';
import 'package:moomalpublication/features/orders/controllers/orders_controller.dart';
import 'package:moomalpublication/features/orders/data/constants/enums.dart';
import 'package:moomalpublication/features/orders/presentation/template/order_card.dart';
import 'package:moomalpublication/features/orders/presentation/widgets/orders_main_tab_item.dart';
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
              _getMainTab(),
              Obx(
                () => Expanded(
                  child: orderController.orderResponse.value.isLoading
                      ? Center(child: customProgressIndicator())
                      : orderController.ordersList.isNotEmpty
                          ? SingleChildScrollView(
                              child: Column(
                                children: [OrderCard()],
                              ),
                            )
                          : Center(
                              child:
                                  EmptyCartView(title: "no_item_ordered".tr)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getMainTab() {
    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 20.v),
        child: Row(
          children: [
            OrdersMainTabItem(
              title: "all".tr,
              isSelected: orderController.selectedMainTestType.value ==
                  OrdersMainTabType.ebook,
              onClick: (orderMainTabType) =>
                  orderController.onMainTabsClick(orderMainTabType),
              orderMainTabType: OrdersMainTabType.ebook,
            ),
            const HorizontalGap(size: 14),
            Expanded(
              child: OrdersMainTabItem(
                title: "subjects".tr,
                isSelected: orderController.selectedMainTestType.value ==
                    OrdersMainTabType.book,
                onClick: (orderMainTabType) =>
                    orderController.onMainTabsClick(orderMainTabType),
                orderMainTabType: OrdersMainTabType.book,
              ),
            ),
            const HorizontalGap(size: 14),
            Expanded(
              child: OrdersMainTabItem(
                title: "topics".tr,
                isSelected: orderController.selectedMainTestType.value ==
                    OrdersMainTabType.test,
                onClick: (orderMainTabType) =>
                    orderController.onMainTabsClick(orderMainTabType),
                orderMainTabType: OrdersMainTabType.test,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
