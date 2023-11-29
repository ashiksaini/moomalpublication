import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/components/organisms/btn_add_to_cart.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/box_shadows.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';

class CardBookItem extends StatelessWidget {
  const CardBookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(scaleRadius(20, context)),
        border: Border.all(color: AppColors.grey),
        boxShadow: [primaryBoxShadow()],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Image
          Container(
            margin: EdgeInsets.symmetric(horizontal: scaleWidth(5, context), vertical: scaleHeight(5, context)),
            height: scaleHeight(180, context),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(scaleRadius(15, context)),
              boxShadow: [primaryBoxShadow()],
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(scaleRadius(15, context)),
                child: Image.asset(
                  AppAssets.icImg,
                  fit: BoxFit.cover,
                )),
          ),

          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: scaleWidth(10, context), vertical: scaleHeight(10, context)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  CustomText(
                    text: "Moomal Rajasthan Study (Class-6 to 10)From -  ₹175",
                    textStyle: CustomTextStyle.textStyle16Bold(context),
                    textAlign: TextAlign.start,
                  ),

                  const VerticalGap(size: 14),

                  // Stars
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

                  const VerticalGap(size: 14),

                  //Add to cart Btn
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: scaleWidth(5, context)),
                    child: BtnAddToCart(),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
