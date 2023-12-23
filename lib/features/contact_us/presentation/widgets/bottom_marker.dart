import 'package:flutter/material.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class BottomMarker extends StatelessWidget {
  const BottomMarker({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: scaleWidth(16, context)),
      child: CustomText(
        text: "© 2021 Moomal Publication All rights reserved",
        textStyle:
            CustomTextStyle.textStyle20SemiMedium(context, color: Colors.grey),
      ),
    );
  }
}
