import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';

class CustomOrangeButton extends StatelessWidget {
  const CustomOrangeButton(
      {super.key,
      required this.onTapButton,
      required this.buttonText,
      this.radius,
      this.color = AppColors.orange,
      this.customTextStyle,
      this.isArrowVisible = false});
  final Function onTapButton;
  final String buttonText;
  final TextStyle? customTextStyle;
  final double? radius;
  final Color? color;
  final bool isArrowVisible;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapButton();
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(radius?.r ?? 10.r),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.v, horizontal: 24.h),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: buttonText,
                textStyle: customTextStyle ??
                    CustomTextStyle.textStyle25Bold(
                      context,
                      color: Colors.white,
                    ),
              ),
              if (isArrowVisible) ...{
                const HorizontalGap(size: 10),
                SvgPicture.asset(
                  AppAssets.icArrowRight,
                  height: 20.h,
                  width: 20.v,
                  color: AppColors.white,
                )
              }
            ],
          ),
        ),
      ),
    );
  }
}
