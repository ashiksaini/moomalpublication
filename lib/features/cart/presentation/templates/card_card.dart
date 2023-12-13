import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_progress_indicator.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/box_shadows.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/cart/data/models/cart_data/item.dart';
import 'package:moomalpublication/features/cart/presentation/widgets/add_cart_button.dart';
import 'package:moomalpublication/features/cart/presentation/widgets/quantity_button.dart';

class CartCard extends StatelessWidget {
  final Item cartItem;
  final bool quantityButton;
  final bool addButton;
  final bool isLast;

  const CartCard({
    super.key,
    required this.cartItem,
    this.quantityButton = false,
    this.addButton = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: scaleWidth(20, context),
            right: scaleWidth(1, context),
            top: scaleWidth(20, context),
            bottom: scaleWidth(20, context),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // book
              bookConatiner(context: context),

              // Detail
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: scaleWidth(20, context),
                    right: scaleWidth(12, context),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        textAlign: TextAlign.left,
                        text: cartItem.name,
                        maxLines: 2,
                        textStyle: CustomTextStyle.textStyle20Bold(context),
                      ),
                      CustomText(
                        text: "₹${cartItem.prices?.price}",
                        textStyle: CustomTextStyle.textStyle20Bold(context),
                      ),
                      const VerticalGap(size: 10),
                      if (quantityButton) QuantityButton(quantity: cartItem.quantity?.toString() ?? ""),
                      if (addButton) const AddButton(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        if (isLast)
          Container(
            width: screenWidth(context),
            height: scaleHeight(1, context),
            color: AppColors.greyLight,
          )
      ],
    );
  }

  Widget bookConatiner({required BuildContext context}) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: scaleWidth(10, context),
        vertical: scaleHeight(15, context),
      ),
      decoration: BoxDecoration(
        color: AppColors.greyLight,
        borderRadius: BorderRadius.circular(scaleRadius(10, context)),
        boxShadow: [primaryBoxShadow()],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(scaleRadius(10, context)),
        child: cartItem.images!.isNotEmpty
            ? CachedNetworkImage(
                imageUrl: cartItem.images!.first.src!,
                height: scaleHeight(130, context),
                width: scaleWidth(100, context),
                fit: BoxFit.fill,
                placeholder: (context, url) {
                  return Center(child: customProgressIndicator());
                },
              )
            : Container(
                width: screenWidth(context),
                color: AppColors.greyLight,
                child: Center(
                  child: CustomText(
                    text: "no_image_preview_available".tr,
                    textStyle: CustomTextStyle.textStyle10Bold(context, color: AppColors.black),
                  ),
                ),
              ),
      ),
    );
  }
}
