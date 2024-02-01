import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/cart/data/models/cart_data/totals.dart';

class OrderDetails extends StatelessWidget {
  final Totals totals;
  final int totalItems;

  const OrderDetails({
    super.key,
    required this.totals,
    required this.totalItems,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: scaleWidth(12, context),
        vertical: scaleWidth(10, context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          CustomText(
            text: "order_details".tr,
            textStyle: CustomTextStyle.textStyle20Bold(context,
                color: AppColors.black),
          ),

          Divider(
            height: scaleWidth(2, context),
            thickness: scaleWidth(1, context),
          ),
          const VerticalGap(size: 20),

          itemCash(
            context: context,
            item: '${"product_total".tr} ($totalItems ${"items".tr})',
            cash: totals.totalItems?.toString() ?? "",
          ),
          const VerticalGap(size: 12),

          itemCash(
            context: context,
            item: "shipping_charges".tr,
            cash: totals.totalShipping?.toString() ?? "",
          ),
          const VerticalGap(size: 20),

          Divider(
            height: scaleWidth(2, context),
            thickness: scaleWidth(1, context),
          ),
          const VerticalGap(size: 8),

          itemCash(
            context: context,
            item: "total_amount".tr,
            cash: totals.totalPrice?.toString() ?? "",
          ),
        ],
      ),
    );
  }

  Widget itemCash({
    required BuildContext context,
    required String item,
    required String cash,
    bool free = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: item,
          textStyle: CustomTextStyle.textStyle20Bold(
            context,
          ),
        ),
        CustomText(
          text: "₹$cash",
          textStyle: CustomTextStyle.textStyle20Bold(
            context,
          ),
        ),
      ],
    );
  }
}
