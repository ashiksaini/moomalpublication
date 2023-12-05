import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/box_shadows.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/detail_page/presentation/widgets/rating_bar.dart';

class DescriptionTabSceen extends StatelessWidget {
  const DescriptionTabSceen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(scaleWidth(11, context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            textAlign: TextAlign.left,
            text: "MOOMAL CURRENT GK ANK-92 is now available in market.",
            textStyle: CustomTextStyle.textStyle20Bold(context,
                color: AppColors.black),
          ),
          const VerticalGap(size: 72),
          CustomText(
            text: "Review",
            textStyle: CustomTextStyle.textStyle25Bold(context,
                color: AppColors.black),
          ),
          const VerticalGap(size: 8),
          CustomText(
            textAlign: TextAlign.left,
            text:
                "There are no reviews yet.Be the first to review “MOOMAL CURRENT GK ANK-92” Your email address will not be published. Required fields are marked *",
            textStyle: CustomTextStyle.textStyle20Bold(context,
                color: AppColors.black),
          ),
          CustomText(
            textAlign: TextAlign.left,
            text:
                "YOUR RATING",
            textStyle: CustomTextStyle.textStyle20Bold(context,
                color: AppColors.black),
          ),
          const StarRatingBar(
            itemSize: 22,
          ),
          const VerticalGap(size: 23),
          reviewButton(context: context, buttonText: "Create a video Review"),
          const VerticalGap(size: 19),
          reviewButton(context: context, buttonText: "Write a Review"),
        ],
      ),
    );
  }
}

Widget reviewButton(
    {required BuildContext context, required String buttonText}) {
  return Container(
    decoration: BoxDecoration(
      color: AppColors.white,
      border: Border.all(color: AppColors.shadow),
      boxShadow: [primaryBoxShadow()],
      borderRadius: BorderRadius.all(
        Radius.circular(scaleRadius(10, context)),
      ),
    ),
    child: Padding(
      padding: EdgeInsets.only(
        top: scaleWidth(16, context),
        bottom: scaleWidth(16, context),
        left: scaleWidth(14, context),
        right: scaleWidth(9, context),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            textAlign: TextAlign.left,
            text: buttonText,
            textStyle:
                CustomTextStyle.textStyle20Bold(context, color: AppColors.grey),
          ),
          SvgPicture.asset(
            AppAssets.icForwardArrow,
            width: 30,
          )
        ],
      ),
    ),
  );
}
