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
import 'package:moomalpublication/features/orders/data/models/order_response_model1/line_item.dart';
import 'package:moomalpublication/features/orders/presentation/template/my_order_card.dart';
import 'package:moomalpublication/features/orders/presentation/widgets/orders_main_tab_item.dart';
import 'package:moomalpublication/routes/name_routes.dart';
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
                          ? _showData()
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

  Widget _showData() {
    if (orderController.selectedMainTestType.value == OrdersMainTabType.ebook) {
      if (orderController.ebookPurchase.isEmpty) {
        return Center(child: EmptyCartView(title: "no_item_ordered".tr));
      }

      return _getDataList(orderController.ebookPurchase);
    } else if (orderController.selectedMainTestType.value ==
        OrdersMainTabType.test) {
      if (orderController.testSeries.isEmpty) {
        return Center(child: EmptyCartView(title: "no_item_ordered".tr));
      }

      return _getDataList(orderController.testSeries);
    } else {
      if (orderController.bookPurchase.isEmpty) {
        return Center(child: EmptyCartView(title: "no_item_ordered".tr));
      }

      return _getDataList(orderController.bookPurchase);
    }
  }

  Widget _getDataList(RxList<LineItem> lineItem) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: lineItem.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: GestureDetector(
            onTap: () {
              orderController.singleProduct.value = lineItem[index];
              AppRouting.toNamed(NameRoutes.ebookOrder);
            },
            child: MyOrderCard(
              downloadLinks: [lineItem[index].link ?? ""],
              lineItem: lineItem[index],
              datePaid: lineItem[index].datePaid,
              status: lineItem[index].status,
              onTapCard: () {
                orderController.singleProduct.value = lineItem[index];
                AppRouting.toNamed(NameRoutes.ebookOrder);
              },
            ),
          ),
        );
      },
    );
  }

  Widget _getMainTab() {
    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 20.v),
        child: Row(
          children: [
            OrdersMainTabItem(
              title: "ebook_purchase".tr,
              isSelected: orderController.selectedMainTestType.value ==
                  OrdersMainTabType.ebook,
              onClick: (orderMainTabType) =>
                  orderController.onMainTabsClick(orderMainTabType),
              orderMainTabType: OrdersMainTabType.ebook,
            ),
            const HorizontalGap(size: 14),
            Expanded(
              child: OrdersMainTabItem(
                title: "book_purchase".tr,
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
                title: "test_series".tr,
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
