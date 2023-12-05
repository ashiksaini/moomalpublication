import 'package:flutter/material.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';

class TestomonialTemplates {
Widget testomonialText(BuildContext context) {
  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      text: 'OUR ',
      style: CustomTextStyle.textStyle25Bold(context, color: AppColors.black),
      children: <TextSpan>[
        TextSpan(
          text: 'CLIENT ',
          style:
              CustomTextStyle.textStyle25Bold(context, color: AppColors.orange),
        ),
        const TextSpan(
          text: 'OR ',
        ),
        TextSpan(
          text: 'STUDENT ',
          style:
              CustomTextStyle.textStyle25Bold(context, color: AppColors.orange),
        ),
        const TextSpan(text: ' TESTIMONIAL'),
      ],
    ),
  );
}
}