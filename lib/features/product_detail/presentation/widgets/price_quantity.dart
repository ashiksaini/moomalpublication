import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/constants/enums.dart';
import 'package:moomalpublication/core/theme/box_shadows.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';
import 'package:moomalpublication/core/utils/snackbar.dart';
import 'package:moomalpublication/features/product_detail/controller/product_detail_controller.dart';

class PriceQuantity extends StatelessWidget {
  final ProductDetailController _productDetailController =
      Get.find<ProductDetailController>();

  PriceQuantity({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Price View
        _getPriceView(context),

        // Quantity view
        _getQuantityView(context),
      ],
    );
  }

  Widget _getPriceView(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: scaleHeight(8, context),
        horizontal: scaleWidth(15, context),
      ),
      decoration: BoxDecoration(
        color: AppColors.orangeLight,
        border: Border.all(color: AppColors.shadow),
        boxShadow: [primaryBoxShadow()],
      ),
      child: CustomText(
        text: "${"price".tr}${_bookPrice()}",
        textStyle: CustomTextStyle.textStyle25Bold(
          context,
          color: AppColors.black,
        ),
      ),
    );
  }

  Widget _getQuantityView(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: scaleHeight(7, context),
        horizontal: scaleWidth(15, context),
      ),
      decoration: BoxDecoration(
        color: AppColors.orangeLight,
        border: Border.all(color: AppColors.shadow),
        boxShadow: [primaryBoxShadow()],
      ),
      child: _dropDown(context),
    );
  }

  Widget _dropDown(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<int>(
        isExpanded: true,
        isDense: true,
        customButton: Row(
          children: [
            // Quantity Txt
            CustomText(
              text:
                  "${"quantity".tr}${_productDetailController.selectedQuantity}",
              textStyle: CustomTextStyle.textStyle25Bold(
                context,
                color: AppColors.black,
              ),
            ),

            const HorizontalGap(size: 8),

            // DropDown icon
            SvgPicture.asset(
              AppAssets.icDropDown,
              colorFilter:
                  const ColorFilter.mode(AppColors.black, BlendMode.srcIn),
              height: scaleHeight(18, context),
              width: scaleWidth(18, context),
            ),
          ],
        ),
        items: _productDetailController.quantities.map((item) {
          return DropdownMenuItem(
            value: item,
            onTap: () {
              if (_productDetailController
                      .productDetailData.value!.productVariationType.value ==
                  ProductVariation.ebook) {
                showSnackBar("ebook_quantity_cannot_be_more_than_one".tr);
              } else {
                _productDetailController.selectedQuantity.value = item;
              }
            },
            child: StatefulBuilder(
              builder: (context, menuSetState) {
                final isSelected =
                    _productDetailController.selectedQuantity.value == item;
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        left: scaleWidth(15, context),
                        right: scaleWidth(10, context),
                        top: scaleHeight(8, context),
                        bottom: scaleHeight(8, context),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: item.toString(),
                            textStyle: CustomTextStyle.textStyle25Bold(context,
                                color: AppColors.black),
                          ),
                          if (isSelected)
                            SvgPicture.asset(AppAssets.icSelectedRadio)
                          else
                            SvgPicture.asset(AppAssets.icUnSelectedRadio)
                        ],
                      ),
                    ),
                    Divider(
                        height: scaleHeight(2, context),
                        thickness: scaleHeight(2, context)),
                  ],
                );
              },
            ),
          );
        }).toList(),
        onChanged: (value) {
          if (_productDetailController
                  .productDetailData.value!.productVariationType.value !=
              ProductVariation.ebook) {
            _productDetailController.selectedQuantity.value = value ?? 1;
          }
        },
        dropdownStyleData: DropdownStyleData(
          padding: EdgeInsets.zero,
          scrollPadding: EdgeInsets.zero,
          maxHeight: scaleHeight(250, context),
          width: scaleWidth(150, context),
          offset: const Offset(-20, 0),
        ),
        menuItemStyleData: MenuItemStyleData(
          height: scaleHeight(53, context),
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }

  String _bookPrice() {
    for (var variation in _productDetailController.productDetailData.value?.variations ?? []) {
      if (_productDetailController.productDetailData.value?.productVariationType.value == ProductVariation.ebook && variation.attributes?.attributePurchase?.toLowerCase().compareTo("ebook") == 0 && variation.stockStatus?.toLowerCase().compareTo("instock") == 0) {
        return variation.price ?? "";
      }

      if (_productDetailController.productDetailData.value?.productVariationType.value == ProductVariation.book && variation.attributes?.attributePurchase?.toLowerCase().compareTo("book") == 0 && variation.stockStatus?.toLowerCase().compareTo("instock") == 0) {
        return variation.price ?? "";
      }
    }

    return _productDetailController.productDetailData.value?.price ?? "";
  }
}
