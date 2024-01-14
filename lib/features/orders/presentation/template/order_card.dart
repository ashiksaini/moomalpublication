import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/cart/presentation/widgets/shadow_container.dart';
import 'package:moomalpublication/features/orders/controllers/orders_controller.dart';
import 'package:moomalpublication/features/quiz/presentation/widgets/card_image.dart';

class OrderCard extends StatelessWidget {
  OrderCard({super.key});
  final OrderController orderController = Get.find<OrderController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            vertical: scaleHeight(30, context),
            horizontal: scaleWidth(8, context)),
        child: Obx(
          () => ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: orderController.ordersList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: ShadowContainer(
                      backgroundColor: AppColors.orangeLighter.withOpacity(0.9),
                      containerChild: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Row(
                          children: [
                            CardImage(
                              image: AppAssets.bookPng,
                              borderColor: AppColors.grey,
                              height: scaleHeight(140, context),
                            ),
                            const HorizontalGap(size: 16),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                      textAlign: TextAlign.start,
                                      text: "Current Affairs 1 Liner",
                                      textStyle:
                                          CustomTextStyle.textStyle25Bold(
                                              context)),
                                  const VerticalGap(size: 30),
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
