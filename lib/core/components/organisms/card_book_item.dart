import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/components/organisms/btn_add_to_cart.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/box_shadows.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class CardBookItem extends StatelessWidget {
  const CardBookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: scaleWidth(200, context),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(scaleRadius(20, context)),
        border: Border.all(color: AppColors.grey),
        boxShadow: [primaryBoxShadow()],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: scaleWidth(5, context), vertical: scaleHeight(5, context)),
            height: scaleHeight(200, context),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(scaleRadius(15, context)),
              boxShadow: [primaryBoxShadow()],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(scaleRadius(15, context)),
              child: CachedNetworkImage(
                imageUrl: "https://loremflickr.com/640/360",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: scaleWidth(10, context), vertical: scaleHeight(10, context)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Moomal Rajasthan Study (Class-6 to 10)From -  ₹175",
                    textStyle: CustomTextStyle.textStyle16Bold(context),
                    textAlign: TextAlign.start,
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (_, index) {
                        return Container(
                          margin: EdgeInsets.only(right: scaleWidth(2, context)),
                          child: SvgPicture.asset(
                            AppAssets.icStar,
                            height: scaleHeight(12, context),
                            width: scaleWidth(12, context),
                          ),
                        );
                      },
                    ),
                  ),

                  BtnAddToCart()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
