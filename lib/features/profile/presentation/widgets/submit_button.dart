import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/box_shadows.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeUtils.width,
      decoration: BoxDecoration(
        color: AppColors.orange,
        boxShadow: [primaryBoxShadow()],
        borderRadius: BorderRadius.all(Radius.circular(10.h)),
      ),
      child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 8.h,
          ),
          child: CustomText(
              text: "submit".tr,
              textStyle: CustomTextStyle.textStyle22Bold(context,
                  color: AppColors.white))),
    );
  }
}
