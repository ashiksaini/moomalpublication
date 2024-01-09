import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';

class EmptyProductView extends StatelessWidget {
  const EmptyProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          AppAssets.icSearchScreenBg,
          height: scaleHeight(190, context),
          width: scaleWidth(200, context),
        ),
        const VerticalGap(size: 30),
        CustomText(
          text: "oops_no_book_found".tr,
          textStyle:
              CustomTextStyle.textStyle20Bold(context, color: AppColors.black),
        ),
      ],
    );
  }
}
