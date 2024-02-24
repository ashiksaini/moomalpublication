import 'package:flutter/material.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class CustomOrangeButton extends StatelessWidget {
  const CustomOrangeButton(
      {super.key, required this.onTapButton, required this.buttonText});
  final Function onTapButton;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapButton();
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.orange,
          borderRadius: BorderRadius.all(
            Radius.circular(10.r),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 4.v,
              horizontal: 24.h),
          child: CustomText(
              text: buttonText,
              textStyle: CustomTextStyle.textStyle25Bold(context,
                  color: Colors.white)),
        ),
      ),
    );
  }
}
