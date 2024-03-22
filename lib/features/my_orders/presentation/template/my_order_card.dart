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
import 'package:moomalpublication/features/cart/presentation/widgets/shadow_container.dart';
import 'package:moomalpublication/features/my_orders/presentation/widgets/image_container.dart';

class MyOrderCard extends StatelessWidget {
  const MyOrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.h),
      child: ShadowContainer(
        borderRadius: 10,
        backgroundColor: AppColors.orange_100,
        containerChild: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      text: 'Order ID #458',
                      textStyle: CustomTextStyle.textStyle12Medium(context,
                          color: AppColors.black)),
                  CustomText(
                      text: 'Sold to Designer',
                      textStyle: CustomTextStyle.textStyle12Medium(context,
                          color: AppColors.black)),
                ],
              ),
            ),
            const Divider(
              height: 1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.h, vertical: 8.v),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const ImageContainer(),
                  // const HorizontalGap(size: 40),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                          text: 'Current Affairs 1 Liner',
                          textStyle: CustomTextStyle.textStyle20Bold(context,
                              color: AppColors.black)),
                      CustomText(
                          text: '5 March 2024',
                          textStyle: CustomTextStyle.textStyle10Regular(context,
                              fontStyle: FontStyle.italic,
                              color: AppColors.black)),
                      const VerticalGap(size: 6),
                      CustomText(
                          text: 'Ebook',
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
            ),
            const VerticalGap(size: 8),
          ],
        ),
      ),
    );
  }
}
