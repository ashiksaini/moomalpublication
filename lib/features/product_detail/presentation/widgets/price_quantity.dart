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
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Price View
          _getPriceView(context),

          // Quantity view
          _getQuantityView(context),
        ],
      );
    });
  }

  Widget _getPriceView(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 8.v,
        horizontal: 15.h,
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
        vertical: 7.v,
        horizontal: 15.h,
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
              height: 18.v,
              width: 18.h,
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
                        left: 15.h,
                        right: 10.h,
                        top: 8.v,
                        bottom: 8.v,
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
                        height: 2.v,
                        thickness: 2.v),
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
          maxHeight: 250.v,
          width: 150.h,
          offset: const Offset(-20, 0),
        ),
        menuItemStyleData: MenuItemStyleData(
          height: 53.v,
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }

  String _bookPrice() {
    for (var variation
        in _productDetailController.productDetailData.value?.variations ?? []) {
      if (_productDetailController
                  .productDetailData.value?.productVariationType.value ==
              ProductVariation.ebook &&
          variation.attributes?.attributePurchase
                  ?.toLowerCase()
                  .compareTo("ebook") ==
              0 &&
          variation.stockStatus?.toLowerCase().compareTo("instock") == 0) {
        return variation.price ?? "";
      }

      if (_productDetailController
                  .productDetailData.value?.productVariationType.value ==
              ProductVariation.book &&
          variation.attributes?.attributePurchase
                  ?.toLowerCase()
                  .compareTo("book") ==
              0 &&
          variation.stockStatus?.toLowerCase().compareTo("instock") == 0) {
        return variation.price ?? "";
      }
    }

    return _productDetailController.productDetailData.value?.price ?? "";
  }
}
