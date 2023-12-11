import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/product_detail/presentation/widgets/similar_product_card.dart';

class SimilarProduct extends StatelessWidget {
  const SimilarProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: scaleWidth(14, context),
        right: scaleWidth(9, context),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                textAlign: TextAlign.left,
                text: "Similar Product",
                textStyle: CustomTextStyle.textStyle25Bold(context,
                    color: AppColors.black),
              ),
              SvgPicture.asset(
                AppAssets.icForwardArrow,
                colorFilter:
                    const ColorFilter.mode(AppColors.black, BlendMode.srcIn),
                width: 35,
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: scaleWidth(12, context)),
            child: const SimilarProductCard(),
          ),
        ],
      ),
    );
  }
}
