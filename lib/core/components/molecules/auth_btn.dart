import 'package:flutter/material.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class AuthBtn extends StatelessWidget {
  final String title;
  const AuthBtn({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: scaleHeight(8, context)),
      color: AppColors.black.withOpacity(0.67),
      child: Center(
        child: CustomText(
          text: title,
          textStyle: CustomTextStyle.textStyle25Bold(context, color: AppColors.white),
        ),
      ),
    );
  }
}
