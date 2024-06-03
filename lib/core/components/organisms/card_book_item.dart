import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/base/product_item/product_variations.dart';
import 'package:moomalpublication/core/components/atoms/custom_progress_indicator.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/components/organisms/btn_add_to_cart.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/constants/enums.dart';
import 'package:moomalpublication/core/theme/box_shadows.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/base/product_item/product_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';

class CardBookItem extends StatelessWidget {
  final Function onCartBtnClick;
  final Function? onBookVariationClick;
  final ProductItem item;

  const CardBookItem({
    super.key,
    required this.item,
    required this.onCartBtnClick,
    this.onBookVariationClick,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: AppColors.grey),
          boxShadow: [primaryBoxShadow()],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image
            _getImage(context),

            // Details
            _getBookDetails(context)
          ],
        ),
      );
    });
  }

  Widget _getImage(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 260.adaptSize,
          width: 200.adaptSize,
          margin: EdgeInsets.symmetric(horizontal: 5.h, vertical: 5.v),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: (item.productImages?.isNotEmpty == true &&
                    item.productImages?[0].src != null &&
                    item.productImages?[0].src!.isNotEmpty == true)
                ? CachedNetworkImage(
                    imageUrl: item.productImages?[0].src ?? "",
                    fit: BoxFit.cover,
                    placeholder: (context, url) {
                      return Center(child: customProgressIndicator());
                    },
                  )
                : Container(
                    width: SizeUtils.width,
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
        ),
        if (_isbookOnSale())
          Positioned(
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.orange,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(20.r))),
              padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 4.v),
              child: CustomText(
                  text: "SALE",
                  textStyle: CustomTextStyle.textStyle14Bold(context,
                      color: AppColors.white)),
            ),
          )
      ],
    );
  }

  Widget _getBookDetails(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(
          left: 10.h,
          right: 10.h,
          bottom: 10.v,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            _getBookTitle(context),

            // Price
            const VerticalGap(size: 4),
            _getBookPrice(context),

            // Variation selection
            const VerticalGap(size: 5),
            _getVariationView(context),

            // Stars
            // ((item.ratingCount ?? 0) > 0)
            //     ? _getStars(context)
            //     : CustomText(
            //         text: "not_rated".tr,
            //         textStyle: CustomTextStyle.textStyle10Bold(
            //           context,
            //           color: AppColors.grey,
            //         ),
            //       ),
            // const Spacer(),

            //Add to cart Btn
            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.h),
                child: BtnAddToCart(
                  isOutOfStock:
                      (!item.isBookAvailable && !item.isEbookAvailable),
                  cartBtnType: item.cartBtnType.value,
                  onClick: () {
                    item.quantity++;
                    onCartBtnClick(item);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getVariationView(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.v),
      child: Row(
        children: [
          if (item.isEbookAvailable)
            GestureDetector(
              onTap: () => onBookVariationClick!(item, ProductVariation.ebook),
              child: Row(
                children: [
                  SvgPicture.asset(
                    (item.productVariationType.value == ProductVariation.ebook)
                        ? AppAssets.icSelectedRadio
                        : AppAssets.icUnSelectedRadio,
                  ),
                  const HorizontalGap(size: 2),
                  CustomText(
                      text: 'ebook'.tr,
                      textStyle: CustomTextStyle.textStyle16Bold(context)),
                ],
              ),
            ),
          if (item.isBookAvailable) ...{
            if (item.isEbookAvailable) const HorizontalGap(size: 10),
            GestureDetector(
              onTap: () => onBookVariationClick!(item, ProductVariation.book),
              child: Row(
                children: [
                  SvgPicture.asset(
                    (item.productVariationType.value == ProductVariation.book)
                        ? AppAssets.icSelectedRadio
                        : AppAssets.icUnSelectedRadio,
                  ),
                  const HorizontalGap(size: 2),
                  CustomText(
                      text: 'book'.tr,
                      textStyle: CustomTextStyle.textStyle16Bold(context)),
                ],
              ),
            ),
          }
        ],
      ),
    );
  }

  Expanded _getStars(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        // itemCount: item.ratingCount,
        itemBuilder: (_, index) {
          return Container(
            margin: EdgeInsets.only(right: 2.h),
            child: SvgPicture.asset(
              AppAssets.icStar,
              height: 12.v,
              width: 12.h,
            ),
          );
        },
      ),
    );
  }

  Widget _getBookTitle(BuildContext context) {
    return CustomText(
      text: item.name,
      textStyle: CustomTextStyle.textStyle16BoldCaladea(context),
      textAlign: TextAlign.start,
      maxLines: 2,
    );
  }

  Widget _getBookPrice(BuildContext context) {
    return Row(
      children: [
        if (item.isBookAvailable || item.isEbookAvailable) ...{
          CustomText(
            text: "${"price_1".tr} : ",
            textStyle: CustomTextStyle.textStyle16Bold(
              context,
              color: AppColors.black,
            ),
            textAlign: TextAlign.start,
          ),
          CustomText(
            text: "₹${_bookPrice()}",
            textStyle: (_isbookOnSale())
                ? CustomTextStyle.textStyle16Bold(context,
                    color: AppColors.red,
                    textDecoration: TextDecoration.lineThrough,
                    textDecorationColor: AppColors.red)
                : CustomTextStyle.textStyle16Bold(
                    context,
                    color: AppColors.black,
                  ),
            textAlign: TextAlign.start,
          ),
          if (_isbookOnSale()) ...{
            const HorizontalGap(size: 8),
            CustomText(
              text: "₹${_bookSalePrice()}",
              textStyle: CustomTextStyle.textStyle18Bold(
                context,
                color: AppColors.black,
              ),
              textAlign: TextAlign.start,
            ),
          }
        } else ...{
          CustomText(
            text: "out_of_stock".tr,
            textStyle: CustomTextStyle.textStyle16Bold(
              context,
              color: AppColors.red,
            ),
            textAlign: TextAlign.start,
          ),
        }
      ],
    );
  }

  String _bookPrice() {
    for (ProductVariations variation in item.productVariations ?? []) {
      if (item.productVariationType.value == ProductVariation.ebook &&
          variation.attributes?[0].option?.toLowerCase().compareTo("ebook") ==
              0 &&
          variation.stockStatus?.toLowerCase().compareTo("instock") == 0) {
        return variation.regularPrice.toString();
      }

      if (item.productVariationType.value == ProductVariation.book &&
          variation.attributes?[0].option?.toLowerCase().compareTo("book") ==
              0 &&
          variation.stockStatus?.toLowerCase().compareTo("instock") == 0) {
        return variation.regularPrice.toString();
      }
    }

    return item.price ?? "";
  }

  String _bookSalePrice() {
    for (ProductVariations variation in item.productVariations ?? []) {
      if (item.productVariationType.value == ProductVariation.ebook &&
          variation.attributes?[0].option?.toLowerCase().compareTo("ebook") ==
              0 &&
          variation.stockStatus?.toLowerCase().compareTo("instock") == 0) {
        return variation.salePrice.toString();
      }

      if (item.productVariationType.value == ProductVariation.book &&
          variation.attributes?[0].option?.toLowerCase().compareTo("book") ==
              0 &&
          variation.stockStatus?.toLowerCase().compareTo("instock") == 0) {
        return variation.salePrice.toString();
      }
    }

    return item.salePrice ?? "";
  }

  bool _isbookOnSale() {
    for (ProductVariations variation in item.productVariations ?? []) {
      if (item.productVariationType.value == ProductVariation.ebook &&
          variation.attributes?[0].option?.toLowerCase().compareTo("ebook") ==
              0 &&
          variation.stockStatus?.toLowerCase().compareTo("instock") == 0) {
        return variation.onSale ?? false;
      }

      if (item.productVariationType.value == ProductVariation.book &&
          variation.attributes?[0].option?.toLowerCase().compareTo("book") ==
              0 &&
          variation.stockStatus?.toLowerCase().compareTo("instock") == 0) {
        return variation.onSale ?? false;
      }
    }

    return item.onSale ?? false;
  }
}
