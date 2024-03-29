import 'package:flutter/material.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/utility.dart';

class CustomButtonBar extends StatelessWidget {
  const CustomButtonBar(
      {super.key,
      required this.buttonText,
      required this.barText,
      this.buttonVisibility = true,
      this.textDecoration = TextDecoration.none,
      this.permalink});
  final String buttonText;
  final bool buttonVisibility;
  final String barText;
  final String? permalink;
  final TextDecoration textDecoration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14.v),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.h),
              child: CustomText(
                text: barText,
                maxLines: 3,
                textAlign: TextAlign.start,
                textStyle: CustomTextStyle.textStyle22Bold(
                  context,
                  color: AppColors.black,
                  decoration: textDecoration,
                ),
              ),
            ),
          ),
          if (buttonVisibility)
            GestureDetector(
              onTap: () {
                Utility.launchurl(permalink ?? '');
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.skinDark,
                  border: Border.all(color: AppColors.skinDark),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 6.v,
                    horizontal: 25.h,
                  ),
                  child: CustomText(
                    text: buttonText,
                    textStyle: CustomTextStyle.textStyle16Bold(
                      context,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
