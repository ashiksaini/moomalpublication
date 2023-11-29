import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';

class CustomAppbar extends StatelessWidget {
  final String? prefixIcon;
  final String? suffixIcon;
  final String title;

  const CustomAppbar({
    super.key,
    required this.title,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: scaleHeight(12, context), horizontal: scaleWidth(15, context)),
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(scaleRadius(20, context)),
          bottomRight: Radius.circular(scaleRadius(20, context)),
        ),
      ),
      child: Row(
        children: [
          if (prefixIcon != null) ...{
            SvgPicture.asset(
              prefixIcon!,
              height: scaleHeight(24, context),
              width: scaleWidth(24, context),
            ),
            const HorizontalGap(size: 12),
          },
          Expanded(
            child: CustomText(
              text: title,
              textStyle: CustomTextStyle.textStyle25Bold(context, color: AppColors.white),
              textAlign: TextAlign.start,
            ),
          ),
          if (suffixIcon != null)
            SvgPicture.asset(
              suffixIcon!,
              height: scaleHeight(24, context),
              width: scaleWidth(24, context),
            ),
        ],
      ),
    );
  }
}
