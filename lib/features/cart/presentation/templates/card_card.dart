import 'package:flutter/material.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/box_shadows.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/cart/presentation/widgets/add_cart_button.dart';
import 'package:moomalpublication/features/cart/presentation/widgets/quantity_button.dart';

class CartCard extends StatelessWidget {
  const CartCard(
      {super.key, this.quatintyButton = false, this.addButton = false});
  final bool quatintyButton;
  final bool addButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: scaleWidth(20, context),
          right: scaleWidth(1, context),
          top: scaleWidth(20, context),
          bottom: scaleWidth(20, context)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          bookConatiner(context: context),
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(
                  left: scaleWidth(28, context),
                  right: scaleWidth(12, context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    textAlign: TextAlign.left,
                    text: "MOOMAL CURRENT GK ANK-92",
                    maxLines: 5,
                    textStyle: CustomTextStyle.textStyle20Bold(context,
                        color: AppColors.greyLight),
                  ),
                  CustomText(
                    text: "₹25",
                    textStyle: CustomTextStyle.textStyle20Bold(context,
                        color: AppColors.greyLight),
                  ),
                  const VerticalGap(size: 9),
                  if (quatintyButton) const QuantityButton(),
                  if (addButton) const AddButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget bookConatiner({required BuildContext context}) {
  return Container(
      decoration: BoxDecoration(
        color: AppColors.greyLighter,
        boxShadow: [primaryBoxShadow()],
        borderRadius: BorderRadius.all(
          Radius.circular(scaleRadius(10, context)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          AppAssets.bookPng,
          width: scaleWidth(112, context),
        ),
      ));
}
