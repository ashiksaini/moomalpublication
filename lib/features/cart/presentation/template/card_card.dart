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
            left: 20.h,
            right: 1.h,
            top: 20.h,
            bottom: 20.h,
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
                    left: 20.h,
                    right: 12.h,
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
                      if (quantityButton) QuantityButton(cartItem: cartItem),
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
            width: SizeUtils.width,
            height: 1.v,
            color: AppColors.greyLight,
          )
      ],
    );
  }

  Widget bookConatiner({required BuildContext context}) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.h,
        vertical: 15.v,
      ),
      decoration: BoxDecoration(
        color: AppColors.greyLight,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [primaryBoxShadow()],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: cartItem.images!.isNotEmpty
            ? CachedNetworkImage(
                imageUrl: cartItem.images!.first.src!,
                height: 130.v,
                width: 100.h,
                fit: BoxFit.fill,
                placeholder: (context, url) {
                  return Center(child: customProgressIndicator());
                },
              )
            : Container(
                height: 130.v,
                width: 100.h,
                color: AppColors.greyLight,
                child: Center(
                  child: CustomText(
                    text: "no_image_preview_available".tr,
                    textStyle: CustomTextStyle.textStyle10Bold(context,
                        color: AppColors.black),
                  ),
                ),
              ),
      ),
    );
  }
}
