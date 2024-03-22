import 'package:flutter/material.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';

class ShippingDetailCard extends StatelessWidget {
  const ShippingDetailCard({super.key});

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
              text: 'Shipping Details',
              textStyle: CustomTextStyle.textStyle15Bold(
                context,
                color: AppColors.black,
              )),
          const VerticalGap(size: 10),
          CustomText(
              text: 'Shipping Details',
              textStyle: CustomTextStyle.textStyle14Regular(
                context,
                color: AppColors.black,
              )),
          const VerticalGap(size: 10),
          const Divider(
            height: 1,
          )
        ],
      ),
    );
  }
}
