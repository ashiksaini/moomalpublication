import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class CustomButtonBar extends StatelessWidget {
  const CustomButtonBar(
      {super.key,
      required this.buttonText,
      required this.barText,
      this.buttonVisibility = true});
  final String buttonText;
  final bool buttonVisibility;
  final String barText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: scaleHeight(14, context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: scaleWidth(10, context)),
              child: CustomText(
                text: barText,
                maxLines: 3,
                textAlign: TextAlign.start,
                textStyle: CustomTextStyle.textStyle22Bold(context,
                    color: AppColors.black),
              ),
            ),
          ),
          if (buttonVisibility)
            Container(
              decoration: BoxDecoration(
                  color: AppColors.skinDark,
                  border: Border.all(color: AppColors.skinDark),
                  borderRadius:
                      BorderRadius.circular(scaleRadius(10, context))),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: scaleHeight(6, context),
                  horizontal: scaleWidth(25, context),
                ),
                child: CustomText(
                    text: buttonText,
                    textStyle: CustomTextStyle.textStyle16Bold(context,
                        color: AppColors.white)),
              ),
            )
        ],
      ),
    );
  }
}
