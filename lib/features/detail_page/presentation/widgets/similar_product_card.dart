import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/box_shadows.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/detail_page/presentation/widgets/rating_bar.dart';

class SimilarProductCard extends StatelessWidget {
  const SimilarProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: scaleWidth(200, context),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.shadow),
        boxShadow: [primaryBoxShadow()],
        borderRadius: BorderRadius.all(
          Radius.circular(scaleRadius(20, context)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(
              AppAssets.bookPng,
              width: scaleWidth(186, context),
              height: scaleWidth(215, context),
            ),
            const VerticalGap(size: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  textAlign: TextAlign.left,
                  text: "MOOMALCURRENT GK ANK-92 From - ₹25",
                  textStyle: CustomTextStyle.textStyle16Bold(context,
                      color: AppColors.grey),
                ),
                radioButtons(context: context),
                StarRatingBar(
                  itemSize: scaleWidth(12, context),
                ),
                const VerticalGap(size: 9)
              ],
            ),
            addtoCartButton(context: context),
          ],
        ),
      ),
    );
  }
}

Widget radioButtons({required BuildContext context}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: scaleWidth(10, context)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 1,
          child: Radio(
            value: 1,
            groupValue: 1,
            fillColor:
                MaterialStateColor.resolveWith((states) => AppColors.orange),
            onChanged: (val) {
              // controller.changeOption(val ?? 1);
            },
          ),
        ),
        const HorizontalGap(size: 14),
        CustomText(
          textAlign: TextAlign.left,
          text: "E Book",
          textStyle: CustomTextStyle.textStyle16BoldGupter(
            context,
          ),
        ),
        const HorizontalGap(size: 20),
        SizedBox(
          width: 1,
          child: Radio(
            value: 2,
            groupValue: 2,
            fillColor:
                MaterialStateColor.resolveWith((states) => AppColors.orange),
            onChanged: (val) {},
          ),
        ),
        const HorizontalGap(size: 14),
        CustomText(
          textAlign: TextAlign.left,
          text: "Book",
          textStyle: CustomTextStyle.textStyle16BoldGupter(
            context,
          ),
        ),
      ],
    ),
  );
}

Widget addtoCartButton({required BuildContext context}) {
  return Container(
    decoration: BoxDecoration(
      color: AppColors.orangeLight,
      border: Border.all(color: AppColors.pinkLight),
      borderRadius: BorderRadius.all(
        Radius.circular(scaleRadius(5, context)),
      ),
    ),
    child: Padding(
      padding: EdgeInsets.only(
          top: scaleWidth(9, context),
          bottom: scaleWidth(9, context),
          left: scaleWidth(20, context),
          right: scaleWidth(20, context)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            textAlign: TextAlign.left,
            text: "ADD TO CART",
            textStyle: CustomTextStyle.textStyle16BoldGupter(context,
                color: AppColors.black),
          ),
          const HorizontalGap(size: 23),
          SvgPicture.asset(AppAssets.icBookmark)
        ],
      ),
    ),
  );
}
