import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';

class BottomDetailBar extends StatelessWidget {
  final bool showSocial;
  const BottomDetailBar({super.key, this.showSocial = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (showSocial)
          CustomText(
            text: "FOLLOW US ON",
            textStyle: CustomTextStyle.textStyle20Bold(
              context,
            ),
          ),
        if (showSocial)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const VerticalGap(size: 12),
              SvgPicture.asset(AppAssets.icYoutube),
              const VerticalGap(size: 18),
              SvgPicture.asset(AppAssets.icFaceBook),
              const VerticalGap(size: 18),
              SvgPicture.asset(AppAssets.icTwitter),
            ],
          ),
        const VerticalGap(size: 12),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: scaleWidth(26, context)),
          child: CustomText(
            text: "© 2021 Moomal Publication All rights reserved",
            textStyle: CustomTextStyle.textStyle20SemiMedium(context,
                color: AppColors.grey),
          ),
        ),
      ],
    );
  }
}
