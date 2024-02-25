import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
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
    return Container(
      height: 195.adaptSize,
      width: 200.adaptSize,
      margin: EdgeInsets.symmetric(
          horizontal: 5.h,
          vertical: 5.v),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.r),
        child: (item.featuredImage?.url != null &&
                item.featuredImage!.url!.isNotEmpty)
            ? CachedNetworkImage(
                imageUrl: item.featuredImage!.url!,
                fit: BoxFit.contain,
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

            // Title
            _getBookPrice(context),

            // Variation selection
            _getVariationView(context),

            // Stars
            ((item.ratingCount ?? 0) > 0)
                ? _getStars(context)
                : CustomText(
                    text: "not_rated".tr,
                    textStyle: CustomTextStyle.textStyle10Bold(
                      context,
                      color: AppColors.grey,
                    ),
                  ),
            const Spacer(),

            //Add to cart Btn
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.h),
              child: BtnAddToCart(
                cartBtnType: item.cartBtnType.value,
                onClick: () {
                  item.quantity++;
                  onCartBtnClick(item);
                },
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
        itemCount: item.ratingCount,
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
      textStyle: CustomTextStyle.textStyle16Bold(context),
      textAlign: TextAlign.start,
      maxLines: 2,
    );
  }

  Widget _getBookPrice(BuildContext context) {
    return CustomText(
      text: "${"price".tr} ${_bookPrice()}",
      textStyle:
          CustomTextStyle.textStyle16Bold(context, color: AppColors.black),
      textAlign: TextAlign.start,
    );
  }

  String _bookPrice() {
    for (var variation in item.variations ?? []) {
      if (item.productVariationType.value == ProductVariation.ebook &&
          variation.attributes?.attributePurchase
                  ?.toLowerCase()
                  .compareTo("ebook") ==
              0 &&
          variation.stockStatus?.toLowerCase().compareTo("instock") == 0) {
        return variation.price ?? "";
      }

      if (item.productVariationType.value == ProductVariation.book &&
          variation.attributes?.attributePurchase
                  ?.toLowerCase()
                  .compareTo("book") ==
              0 &&
          variation.stockStatus?.toLowerCase().compareTo("instock") == 0) {
        return variation.price ?? "";
      }
    }

    return item.price ?? "";
  }
}
