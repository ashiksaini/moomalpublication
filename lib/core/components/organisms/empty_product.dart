import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';

class EmptyProductView extends StatelessWidget {
  const EmptyProductView({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          AppAssets.icSearchScreenBg,
          height: 190.v,
          width: 200.h,
        ),
        const VerticalGap(size: 30),
        CustomText(
          text: title,
          textStyle:
              CustomTextStyle.textStyle20Bold(context, color: AppColors.black),
        ),
      ],
    );
  }
}
