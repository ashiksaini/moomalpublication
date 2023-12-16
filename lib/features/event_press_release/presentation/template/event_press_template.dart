import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/cart/presentation/widgets/shadow_container.dart';
import 'package:moomalpublication/features/event_press_release/controller/event_press_controller.dart';
import 'package:moomalpublication/features/quiz/presentation/widgets/card_image.dart';

class EventAndPressCard extends StatelessWidget {
  EventAndPressCard({
    super.key,
    required this.index,
  });
  final int index;

  final EventPressController _eventPressController =
      Get.put(EventPressController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _eventPressController.navigateSettingDetailScreen(
            appBarTitle: 'Event Old Book');
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: scaleHeight(16, context),
            horizontal: scaleWidth(8, context)),
        child: ShadowContainer(
          containerChild: Padding(
            padding: EdgeInsets.symmetric(
                vertical: scaleHeight(16, context),
                horizontal: scaleWidth(14, context)),
            child: Row(
              children: [
                CardImage(
                  image: AppAssets.bookPng,
                  borderColor: AppColors.blue,
                  height: scaleHeight(130, context),
                ),
                const HorizontalGap(size: 12),
                Flexible(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: scaleWidth(12, context)),
                    child: Obx(
                      () => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            textAlign: TextAlign.left,
                            text: "Event Old Book",
                            maxLines: 4,
                            textStyle: CustomTextStyle.textStyle22Bold(context,
                                color: AppColors.black,
                                decoration: TextDecoration.underline),
                          ),
                          const VerticalGap(size: 6),
                          CustomText(
                            text:
                                "Lorem ipsum is placeholder text commonly used in the graphicLorem ipsum is placeholder text commonly used in the graphicLorem Lorem ipsum is placeholder text commonly used in the graphicLorem ipsum is placeholder text commonly used in the graphicLorem",
                            textStyle: CustomTextStyle.textStyle15Bold(context,
                                color: AppColors.black),
                            maxLines: _eventPressController.getReadMore(index)
                                ? 1000
                                : 4,
                            textAlign: TextAlign.start,
                          ),
                          const VerticalGap(size: 9),
                          GestureDetector(
                            onTap: () {
                              _eventPressController.readMore(index);
                            },
                            child: CustomText(
                              text: _eventPressController.getReadMore(index)
                                  ? "Read Less"
                                  : "Read More",
                              textStyle: CustomTextStyle.textStyle20SemiMedium(
                                  context,
                                  color: AppColors.black),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          borderRadius: 10,
          borderColor: Colors.transparent,
        ),
      ),
    );
  }
}
