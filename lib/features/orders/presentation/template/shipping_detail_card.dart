import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/orders/data/models/shipping.dart';

class ShippingDetailCard extends StatelessWidget {
  const ShippingDetailCard({super.key, required this.shipping});
  final Shipping shipping;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(height: 1),
          const VerticalGap(size: 20),
          CustomText(
              text: 'shipping_details'.tr,
              textStyle: CustomTextStyle.textStyle15Bold(
                context,
                color: AppColors.black,
              )),
          const VerticalGap(size: 10),
          textbox(context: context, text: shipping.address1 ?? ''),
          textbox(context: context, text: shipping.address2 ?? ''),
          textbox(context: context, text: shipping.city ?? ''),
          textbox(context: context, text: shipping.state ?? ''),
          textbox(context: context, text: shipping.postcode ?? ''),
          textbox(context: context, text: shipping.country ?? ''),
          textbox(context: context, text: shipping.phone ?? ''),
          const VerticalGap(size: 10),
          const Divider(
            height: 1,
          )
        ],
      ),
    );
  }

  Widget textbox({required BuildContext context, required String text}) {
    return text.isNotEmpty
        ? CustomText(
            text: text,
            textStyle: CustomTextStyle.textStyle14Regular(
              context,
              color: AppColors.black,
            ))
        : const SizedBox.shrink();
  }
}
