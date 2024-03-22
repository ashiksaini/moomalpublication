import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/cart/presentation/widgets/shadow_container.dart';
import 'package:moomalpublication/features/event_press_release/controller/event_press_controller.dart';

class PressEventCard extends StatelessWidget {
  PressEventCard({super.key, this.withGradient = false, required this.index});
  final bool withGradient;
  final int index;
  final EventPressController _eventPressController =
      Get.find<EventPressController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.v),
      child: ShadowContainer(
        backgroundColor: withGradient ? null : AppColors.pinkLighter,
        borderColor: withGradient ? AppColors.greendark : AppColors.pinkDark,
        linearGradient: withGradient
            ? const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.greenLight,
                  AppColors.greenDarker,
                ],
              )
            : null,
        containerChild: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.v),
          child: CustomText(
              text: _eventPressController.pressReleaseList[index].postContent,
              // "central_economic_review_2022_23_&_central_budget_2023_24".tr,
              textStyle: CustomTextStyle.textStyle20Regular(context,
                  color: AppColors.black)),
        ),
      ),
    );
  }
}
