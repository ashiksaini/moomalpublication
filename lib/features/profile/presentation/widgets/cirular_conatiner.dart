import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeUtils.height / 5,
      width: SizeUtils.width,
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(250.v),
          bottomRight: Radius.circular(250.v),
        ),
      ),
      child: CustomText(
        text: 'my_profile'.tr,
        textStyle: CustomTextStyle.textStyle25Bold(
          context,
          color: AppColors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
