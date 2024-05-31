import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/orders/data/models/order_response_model.dart';

class OrderDetailCard extends StatelessWidget {
  const OrderDetailCard({super.key, required this.lineItem});
  final LineItem lineItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
              text: 'order_details'.tr,
              textStyle: CustomTextStyle.textStyle15Bold(context,
                  color: AppColors.black)),
          const VerticalGap(size: 12),
          CustomText(
              text:
                  '${'price_details'.tr} (x ${lineItem.quantity} ${'item'.tr})',
              textStyle: CustomTextStyle.textStyle15Bold(context,
                  color: AppColors.black)),
          const VerticalGap(size: 6),
          CustomText(
              text: '${'product_id'.tr} : ${lineItem.id}',
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
                        text: 'subtotal'.tr,
                        textStyle: CustomTextStyle.textStyle14Regular(
                          context,
                          fontStyle: FontStyle.italic,
                          color: AppColors.black,
                        )),
                    CustomText(
                        text: '₹${lineItem.subtotal}',
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
                  text: 'total'.tr,
                  textStyle: CustomTextStyle.textStyle15Bold(
                    context,
                    color: AppColors.black,
                  )),
              Padding(
                padding: EdgeInsets.only(right: 4.h),
                child: CustomText(
                    text: '₹${lineItem.total}',
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
