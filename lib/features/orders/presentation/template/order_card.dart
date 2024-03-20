import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/constants/app_constants.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/date_time_utils.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/cart/presentation/widgets/shadow_container.dart';
import 'package:moomalpublication/features/orders/controllers/orders_controller.dart';
import 'package:moomalpublication/features/orders/data/models/order_response_model.dart';
import 'package:moomalpublication/features/orders/presentation/template/text_card.dart';
import 'package:moomalpublication/features/quiz/presentation/widgets/card_image.dart';

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

                if (dataItem.lineItems != null) {
                  listItem = dataItem.lineItems![0];
                }
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: ShadowContainer(
                      backgroundColor: AppColors.orangeLighter.withOpacity(0.9),
                      containerChild: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 6.h, vertical: 8.v),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CardImage(
                              image: listItem.image!.src.toString(),
                              borderColor: AppColors.grey,
                            ),
                            const HorizontalGap(size: 16),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextCard(
                                      name: 'name'.tr,
                                      subject: listItem.name.toString()),
                                  TextCard(
                                    name: 'date_paid'.tr,
                                    subject: DateTimeUtils.formatDate(
                                      date: dataItem.datePaid ?? DateTime.now(),
                                      formatType: AppConstants.dateFormatter,
                                    ),
                                  ),
                                  TextCard(
                                      name: 'price_no'.tr,
                                      subject:
                                          '₹ ${listItem.price.toString()}'),
                                  const VerticalGap(size: 10),
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                );
              }),
        ));
  }
}
