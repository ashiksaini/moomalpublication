import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/my_orders/presentation/template/my_order_card.dart';
import 'package:moomalpublication/features/orders/controllers/orders_controller.dart';
import 'package:moomalpublication/features/orders/data/models/order_response_model.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';

class OrderCard extends StatelessWidget {
  OrderCard({super.key});
  final OrderController orderController = Get.find<OrderController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 30.v, horizontal: 8.h),
        child: Obx(
          () => ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: orderController.ordersList.length,
              itemBuilder: (context, index) {
                OrderResponseModel dataItem = orderController.ordersList[index];
                LineItem listItem = LineItem();

                if (dataItem.lineItems != null &&
                    dataItem.lineItems!.isNotEmpty) {
                  listItem = dataItem.lineItems![0];
                } else {
                  listItem = LineItem();
                }
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: MyOrderCard(
                    downloadLinks: dataItem.downloadLinks ?? [],
                    lineItem: listItem,
                    datePaid: dataItem.datePaid,
                    onTapCard: () {
                      orderController.singleProduct.value = dataItem;
                      AppRouting.toNamed(NameRoutes.ebookOrder);
                    },
                  ),

                  // ShadowContainer(
                  //     backgroundColor: AppColors.orangeLighter.withOpacity(0.9),
                  //     containerChild: Padding(
                  //       padding: EdgeInsets.symmetric(
                  //           horizontal: 6.h, vertical: 8.v),
                  //       child: Row(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           CardImage(
                  //             image: listItem.image != null
                  //                 ? listItem.image!.src.toString()
                  //                 : '',
                  //             borderColor: AppColors.grey,
                  //           ),
                  //           const HorizontalGap(size: 16),
                  //           Flexible(
                  //             child: Column(
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 TextCard(
                  //                     name: 'name'.tr,
                  //                     subject: listItem.name.toString()),
                  //                 TextCard(
                  //                   name: 'date_paid'.tr,
                  //                   subject: DateTimeUtils.formatDate(
                  //                     date: dataItem.datePaid ?? DateTime.now(),
                  //                     formatType: AppConstants.dateFormatter,
                  //                   ),
                  //                 ),
                  //                 TextCard(
                  //                     name: 'price_no'.tr,
                  //                     subject:
                  //                         '₹ ${listItem.price.toString()}'),
                  //                 const VerticalGap(size: 10),
                  //               ],
                  //             ),
                  //           )
                  //         ],
                  //       ),
                  //     )),
                );
              }),
        ));
  }
}
