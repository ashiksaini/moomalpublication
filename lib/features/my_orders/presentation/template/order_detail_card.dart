import 'package:flutter/material.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';

class OrderDetailCard extends StatelessWidget {
  const OrderDetailCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
              text: 'Order Details',
              textStyle: CustomTextStyle.textStyle15Bold(context,
                  color: AppColors.black)),
          const VerticalGap(size: 12),
          CustomText(
              text: 'Price Details (x 1 item)',
              textStyle: CustomTextStyle.textStyle15Bold(context,
                  color: AppColors.black)),
          const VerticalGap(size: 6),
          CustomText(
              text: 'Product ID : 12354',
              textStyle: CustomTextStyle.textStyle14Regular(
                context,
                fontStyle: FontStyle.italic,
                color: AppColors.black,
              )),
          const VerticalGap(size: 4),
          Padding(
            padding: EdgeInsets.only(right: 4.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                        text: 'SubTotal',
                        textStyle: CustomTextStyle.textStyle14Regular(
                          context,
                          fontStyle: FontStyle.italic,
                          color: AppColors.black,
                        )),
                    CustomText(
                        text: '15',
                        textStyle: CustomTextStyle.textStyle14Bold(
                          context,
                          color: AppColors.black,
                        )),
                  ],
                ),
                const VerticalGap(size: 10),
                const Divider(height: 1),
              ],
            ),
          ),
          const VerticalGap(size: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                  text: 'Total',
                  textStyle: CustomTextStyle.textStyle15Bold(
                    context,
                    color: AppColors.black,
                  )),
              Padding(
                padding: EdgeInsets.only(right: 4.h),
                child: CustomText(
                    text: '15',
                    textStyle: CustomTextStyle.textStyle15Bold(
                      context,
                      color: AppColors.black,
                    )),
              ),
            ],
          ),
          const VerticalGap(size: 14),
         
        ],
      ),
    );
  }
}
