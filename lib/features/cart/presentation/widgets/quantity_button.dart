import 'package:flutter/material.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/box_shadows.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';
import 'package:moomalpublication/features/cart/presentation/widgets/shadow_container.dart';

class QuantityButton extends StatelessWidget {
  const QuantityButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Quantity:",
          maxLines: 5,
          textStyle: CustomTextStyle.textStyle20SemiMedium(context,
              color: AppColors.black),
        ),
        quantityIncDecButton(context)
      ],
    );
  }
}

Widget quantityIncDecButton(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.greyLight,
              border: Border.all(color: AppColors.shadow),
              boxShadow: [primaryBoxShadow()],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(scaleWidth(5, context)),
                bottomLeft: Radius.circular(scaleWidth(5, context)),
              ),
            ),
            child: const Icon(Icons.add),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: [primaryBoxShadow()],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: scaleWidth(14, context),
              ),
              child: CustomText(
                text: "1",
                textStyle: CustomTextStyle.textStyle20SemiMedium(context,
                    color: AppColors.black),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.greyLight,
              border: Border.all(color: AppColors.shadow),
              boxShadow: [primaryBoxShadow()],
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(scaleWidth(5, context)),
                bottomRight: Radius.circular(scaleWidth(5, context)),
              ),
            ),
            child: const Icon(Icons.add),
          ),
        ],
      ),
      Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.shadow),
          boxShadow: [primaryBoxShadow()],
          borderRadius: BorderRadius.all(
            Radius.circular(scaleWidth(5, context)),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: scaleWidth(1, context),
              horizontal: scaleWidth(8, context)),
          child: CustomText(
            text: "Delete",
            textStyle: CustomTextStyle.textStyle20SemiMedium(context,
                color: AppColors.black),
          ),
        ),
      ),
    ],
  );
}
