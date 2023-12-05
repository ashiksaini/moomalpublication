import 'package:flutter/material.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/components/organisms/custom_drop_down_1.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/box_shadows.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/detail_page/presentation/templates/book_detail_tabbar.dart';
import 'package:moomalpublication/features/detail_page/presentation/templates/similar_product.dart';
import 'package:moomalpublication/features/detail_page/presentation/widgets/book_type_grid.dart';
import 'package:moomalpublication/features/detail_page/presentation/widgets/price_quantity.dart';

class DetailContainer extends StatelessWidget {
  const DetailContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 780,
                //760
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.orangeLight,
                  border: Border.all(color: AppColors.shadow),
                  boxShadow: [primaryBoxShadow()],
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(scaleRadius(20, context)),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const VerticalGap(size: 101),
                    Image.asset(AppAssets.bookPng),
                    CustomText(
                      text: "MOOMAL CURRENT GK ANK-92",
                      textStyle: CustomTextStyle.textStyle30BoldPlayfair(
                          context,
                          color: AppColors.greyLight),
                    ),
                    const VerticalGap(size: 5),
                    CustomText(
                      text: "By Moomal Publication",
                      textStyle: CustomTextStyle.textStyle20BoldPlayfair(
                          context,
                          color: AppColors.greyLight),
                    ),
                    const VerticalGap(size: 31),
                    const PriceQuantity(),
                   
                  ],
                ),
              ),
              const BookTypeGrid(),
              Padding(
                padding: EdgeInsets.all(scaleWidth(13, context)),
                child: CustomText(
                  text: "Book Overview",
                  textStyle: CustomTextStyle.textStyle25Bold(context,
                      color: AppColors.black),
                ),
              ),
              const VerticalGap(size: 32),
              const BookDetailTabBar(),
              const SimilarProduct(),
            ],
          ),
        ),
        const Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: CustomAppbar(
            title: "MOOMAL CURRENT GK ANK-92",
            maxLine: 1,
            prefixIcon: AppAssets.icBackArrow,
            suffixIcon: AppAssets.icShare,
          ),
        ),
      ],
    );
  }
}
