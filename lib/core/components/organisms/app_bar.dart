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
  final Function? onPrefixIconClick;
  final Function? onSuffixIconClick;
  final int? maxLine;
  final TextAlign? textAlign;

  const CustomAppbar(
      {super.key,
      required this.title,
      this.prefixIcon,
      this.suffixIcon,
      this.onPrefixIconClick,
      this.onSuffixIconClick,
      this.maxLine,
      this.textAlign = TextAlign.start});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: 12.v,
          horizontal: 15.h),
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
      ),
      child: Row(
        children: [
          if (prefixIcon != null) ...{
            GestureDetector(
              onTap: () => onPrefixIconClick!(),
              child: SvgPicture.asset(
                prefixIcon!,
                height: 24.v,
                width: 24.h,
              ),
            ),
            const HorizontalGap(size: 12),
          },
          Expanded(
            child: CustomText(
              text: title,
              maxLines: maxLine,
              textStyle: CustomTextStyle.textStyle25Bold(context,
                  color: AppColors.white),
              textAlign: textAlign,
            ),
          ),
          if (suffixIcon != null)
            GestureDetector(
              onTap: () => onSuffixIconClick!(),
              child: SvgPicture.asset(
                suffixIcon!,
                height: 24.v,
                width: 24.h,
              ),
            ),
        ],
      ),
    );
  }
}
