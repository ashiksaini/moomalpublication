import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';

class ThankYouPageTemplate extends StatelessWidget {
  const ThankYouPageTemplate({super.key});

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
              text: 'Thank you for your order',
              textStyle: CustomTextStyle.textStyle36Bold(context,
                  color: AppColors.white),
            ),
          ),
          const VerticalGap(size: 18),
          CustomText(
            text: 'ORDER NUMBER: 13053',
            textStyle: CustomTextStyle.textStyle14Bold(context,
                decoration: TextDecoration.underline, color: AppColors.white),
          ),
          CustomText(
            text: 'DATE: March 4, 2024',
            textStyle: CustomTextStyle.textStyle14Bold(context,
                decoration: TextDecoration.underline, color: AppColors.white),
          )
        ],
      ),
    );
  }
}
