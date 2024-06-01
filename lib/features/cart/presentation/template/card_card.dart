import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_progress_indicator.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
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
            crossAxisAlignment: CrossAxisAlignment.center,
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
                        text:
                            '${cartItem.name} ${(cartItem.variation?.isNotEmpty == true) ? (" - ${cartItem.variation?[0].value}") : "" }',
                        maxLines: 3,
                        textStyle:
                            CustomTextStyle.textStyle20BoldCaladea(context),
                      ),
                      Row(
                        children: [
                          CustomText(
                            text: 'price_1'.tr,
                            textStyle: CustomTextStyle.textStyle18Bold(context),
                          ),
                          CustomText(
                            text:
                                " : ${cartItem.prices?.currencySymbol}${cartItem.prices?.price}",
                            textStyle: CustomTextStyle.textStyle20BoldCaladea(
                                context,
                                color: AppColors.black),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CustomText(
                            text: 'total_price'.tr,
                            textStyle: CustomTextStyle.textStyle18Bold(context),
                          ),
                          CustomText(
                            text:
                                " : ${cartItem.itemTotals?.currencySymbol}${cartItem.itemTotals?.lineTotal}",
                            textStyle: CustomTextStyle.textStyle20BoldCaladea(
                                context,
                                color: AppColors.black),
                          ),
                        ],
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
        horizontal: 5.h,
        vertical: 5.v,
      ),
      decoration: BoxDecoration(
        color: AppColors.greyLight,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: cartItem.images!.isNotEmpty
            ? CachedNetworkImage(
                imageUrl: cartItem.images!.first.src!,
                height: 170.adaptSize,
                width: 120.adaptSize,
                fit: BoxFit.cover,
                placeholder: (context, url) {
                  return Center(child: customProgressIndicator());
                },
              )
            : Container(
                height: 150.adaptSize,
                width: 120.adaptSize,
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
