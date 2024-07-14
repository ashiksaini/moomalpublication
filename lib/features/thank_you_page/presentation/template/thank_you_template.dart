import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/date_time_utils.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/thank_you_page/controller/thank_you_controller.dart';

class ThankYouPageTemplate extends StatelessWidget {
  ThankYouPageTemplate({super.key});

  final OrderSuccessController orderSuccessController =
      Get.find<OrderSuccessController>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppAssets.icCheck),
          const VerticalGap(size: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 86.h),
            child: CustomText(
              text: 'thank_you_for_your_order'.tr,
              textStyle: CustomTextStyle.textStyle36Bold(context,
                  color: AppColors.white),
            ),
          ),
          const VerticalGap(size: 18),
          CustomText(
            text: '${'order_number'.tr}: ${orderSuccessController.orderId}',
            textStyle: CustomTextStyle.textStyle14Bold(context,
                decoration: TextDecoration.underline, color: AppColors.white),
          ),
          CustomText(
            text:
                '${'date'.tr} : ${DateTimeUtils.getCurrentDate(outputFormat: "MMM dd, yyyy")}',
            textStyle: CustomTextStyle.textStyle14Bold(context,
                decoration: TextDecoration.underline, color: AppColors.white),
          )
        ],
      ),
    );
  }
}
