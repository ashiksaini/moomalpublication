import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/address/presentation/widgets/add.dart';
import 'package:moomalpublication/features/my_orders/presentation/widgets/image_container.dart';

class ProductDetailCard extends StatelessWidget {
  const ProductDetailCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
              text: 'Product Details',
              textStyle: CustomTextStyle.textStyle15Bold(context,
                  color: AppColors.black)),
          const VerticalGap(size: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // const HorizontalGap(size: 0),
              const ImageContainer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                      text: 'Current Affairs 1 Liner',
                      textStyle: CustomTextStyle.textStyle20Bold(context,
                          color: AppColors.black)),
                  CustomText(
                      text: '&15',
                      textStyle: CustomTextStyle.textStyle20Bold(context,
                          color: AppColors.black)),
                  CustomText(
                      text: '5 March 2024',
                      textStyle: CustomTextStyle.textStyle14Regular(
                        context,
                        fontStyle: FontStyle.italic,
                        color: AppColors.black,
                      )),
                  const VerticalGap(size: 6),
                  CustomText(
                      text: 'Expire - Never',
                      textStyle: CustomTextStyle.textStyle15Bold(context,
                          color: AppColors.black)),
                  const VerticalGap(size: 12),
                  Row(
                    children: [
                      CustomOrangeButton(
                        buttonText: "view".tr,
                        onTapButton: () {},
                        customTextStyle: CustomTextStyle.textStyle16Bold(
                            context,
                            color: AppColors.white),
                        radius: 6,
                      ),
                      const HorizontalGap(size: 16),
                      CustomOrangeButton(
                        buttonText: "Cancel Request".tr,
                        onTapButton: () {},
                        customTextStyle: CustomTextStyle.textStyle16Bold(
                            context,
                            color: AppColors.white),
                        radius: 6,
                      ),
                    ],
                  ),
                ],
              ),
              SvgPicture.asset(
                AppAssets.icForwardArrow,
                width: 30.h,
              ),
            ],
          ),
          const VerticalGap(size: 18),
          const Divider(height: 1)
        ],
      ),
    );
  }
}
