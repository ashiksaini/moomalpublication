import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/box_shadows.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/cart/controller/cart_controller.dart';
import 'package:moomalpublication/features/cart/data/models/cart_data/item.dart';

class QuantityButton extends StatelessWidget {
  final Item cartItem;
  QuantityButton({super.key, required this.cartItem});

  final CartController _cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "quantity_txt".tr,
          maxLines: 5,
          textStyle: CustomTextStyle.textStyle20SemiBold(context,
              color: AppColors.black),
        ),
        quantityIncDecButton(context)
      ],
    );
  }

  Widget quantityIncDecButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Inc Desc view
        _getIncDescView(context),

        // Delete btn
        _getDeleteBtn(context),
      ],
    );
  }

  Widget _getDeleteBtn(BuildContext context) {
    return GestureDetector(
      onTap: () => _cartController.onDeleteItem(cartItem),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.grey.withOpacity(0.5)),
          boxShadow: [primaryBoxShadow()],
          borderRadius:
              BorderRadius.all(Radius.circular(scaleWidth(5, context))),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: scaleWidth(2, context),
            horizontal: scaleWidth(8, context),
          ),
          child: const Icon(
            Icons.delete,
            color: AppColors.red,
          ),
        ),
      ),
    );
  }

  Widget _getIncDescView(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(scaleRadius(5, context)),
          boxShadow: [primaryBoxShadow()]),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => _cartController.onDesc(cartItem),
            child: Container(
              padding: EdgeInsets.all(scaleWidth(2, context)),
              decoration: BoxDecoration(
                color: AppColors.greyLight,
                border: Border.all(color: AppColors.grey.withOpacity(0.5)),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(scaleRadius(5, context)),
                  bottomLeft: Radius.circular(scaleRadius(5, context)),
                ),
              ),
              child: const Icon(Icons.remove),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: scaleWidth(10, context)),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border(
                top: BorderSide(color: AppColors.grey.withOpacity(0.5)),
                bottom: BorderSide(color: AppColors.grey.withOpacity(0.5)),
              ),
            ),
            child: CustomText(
              text: cartItem.quantity.toString(),
              textStyle: CustomTextStyle.textStyle20SemiBold(context,
                  color: AppColors.black),
              maxLines: 1,
            ),
          ),
          GestureDetector(
            onTap: () => _cartController.onInc(cartItem),
            child: Container(
              padding: EdgeInsets.all(scaleWidth(2, context)),
              decoration: BoxDecoration(
                color: AppColors.greyLight,
                border: Border.all(color: AppColors.grey.withOpacity(0.5)),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(scaleRadius(5, context)),
                  bottomRight: Radius.circular(scaleRadius(5, context)),
                ),
              ),
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
