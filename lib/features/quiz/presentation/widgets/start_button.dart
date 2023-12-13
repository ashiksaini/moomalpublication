import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class StartButton extends StatelessWidget {
  const StartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.orange,
        borderRadius: BorderRadius.all(
          Radius.circular(scaleRadius(6, context)),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: scaleHeight(4, context),
            horizontal: scaleWidth(8, context)),
        child: CustomText(
            text: "Start Quiz",
            textStyle: CustomTextStyle.textStyle18Regular(context,
                decoration: TextDecoration.underline, color: Colors.white)),
      ),
    );
  }
}
