import 'package:flutter/material.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class DropDownItem1 extends StatelessWidget {
  final String title;

  const DropDownItem1({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColors.white),
      padding: EdgeInsets.symmetric(
        vertical: 10.v,
        horizontal: 30.h,
      ),
      child: CustomText(
          text: title, textStyle: CustomTextStyle.textStyle18Bold(context)),
    );
  }
}
