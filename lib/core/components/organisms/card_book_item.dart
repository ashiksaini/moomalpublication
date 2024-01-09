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
          borderRadius: BorderRadius.circular(scaleRadius(20, context)),
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
      height: scaleHeight(195, context),
      margin: EdgeInsets.symmetric(
          horizontal: scaleWidth(5, context),
          vertical: scaleHeight(5, context)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(scaleRadius(15, context)),
        child: (item.featuredImage?.url != null && item.featuredImage!.url!.isNotEmpty)
            ? CachedNetworkImage(
                imageUrl: item.featuredImage!.url!,
                fit: BoxFit.cover,
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
          left: scaleWidth(10, context),
          right: scaleWidth(10, context),
          bottom: scaleHeight(10, context),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            _getBookTitle(context),

            // Variation selection
            Padding(
              padding: EdgeInsets.symmetric(vertical: scaleHeight(5, context)),
              child: Row(
                children: [
                  if (item.isEbookAvailable)
                    GestureDetector(
                      onTap: () =>
                          onBookVariationClick!(item, ProductVariation.ebook),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            (item.productVariationType.value ==
                                    ProductVariation.ebook)
                                ? AppAssets.icSelectedRadio
                                : AppAssets.icUnSelectedRadio,
                          ),
                          const HorizontalGap(size: 2),
                          CustomText(
                              text: 'ebook'.tr,
                              textStyle:
                                  CustomTextStyle.textStyle16Bold(context)),
                        ],
                      ),
                    ),
                  if (item.isBookAvailable) ...{
                    const HorizontalGap(size: 10),
                    GestureDetector(
                      onTap: () =>
                          onBookVariationClick!(item, ProductVariation.book),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            (item.productVariationType.value ==
                                    ProductVariation.book)
                                ? AppAssets.icSelectedRadio
                                : AppAssets.icUnSelectedRadio,
                          ),
                          const HorizontalGap(size: 2),
                          CustomText(
                              text: 'book'.tr,
                              textStyle:
                                  CustomTextStyle.textStyle16Bold(context)),
                        ],
                      ),
                    ),
                  }
                ],
              ),
            ),

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
              padding: EdgeInsets.symmetric(horizontal: scaleWidth(5, context)),
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

  Expanded _getStars(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: item.ratingCount,
        itemBuilder: (_, index) {
          return Container(
            margin: EdgeInsets.only(right: scaleWidth(2, context)),
            child: SvgPicture.asset(
              AppAssets.icStar,
              height: scaleHeight(12, context),
              width: scaleWidth(12, context),
            ),
          );
        },
      ),
    );
  }

  CustomText _getBookTitle(BuildContext context) {
    return CustomText(
      text: item.name,
      textStyle: CustomTextStyle.textStyle16Bold(context),
      textAlign: TextAlign.start,
      maxLines: 2,
    );
  }
}
