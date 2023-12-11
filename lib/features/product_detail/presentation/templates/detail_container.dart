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
import 'package:moomalpublication/features/product_detail/controller/product_detail_controller.dart';
import 'package:moomalpublication/features/product_detail/presentation/templates/book_detail_tabbar.dart';
import 'package:moomalpublication/features/product_detail/presentation/templates/similar_product.dart';
import 'package:moomalpublication/features/product_detail/presentation/widgets/book_type_grid.dart';
import 'package:moomalpublication/features/product_detail/presentation/widgets/price_quantity.dart';

class DetailContainer extends StatelessWidget {
  final ProductDetailController _productDetailController = Get.find<ProductDetailController>();
  DetailContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return (_productDetailController.productDetailResponse.value.isLoading || _productDetailController.productReviewsResponse.value.isLoading || _productDetailController.similarProductResponse.value.isLoading)
            ? SizedBox(
                height: screenHeight(context) - scaleHeight(60, context),
                child: Center(
                  child: customProgressIndicator(),
                ),
              )
            : _getBookDetailView(context);
      },
    );
  }

  Container _getBookDetailView(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Book View
          _getBookView(context),
          const VerticalGap(size: 30),

          // Book Detail Grid
          const BookTypeGrid(),
          const VerticalGap(size: 50),

          // Book Overview
          Padding(
            padding: EdgeInsets.only(left: scaleWidth(15, context)),
            child: CustomText(
              text: "book_overview".tr,
              textStyle: CustomTextStyle.textStyle25Bold(
                context,
                color: AppColors.black,
              ),
            ),
          ),
          const VerticalGap(size: 30),

          // Book Details
          const BookDetailTabBar(),
          const VerticalGap(size: 50),

          // Book Overview
          Padding(
            padding: EdgeInsets.only(left: scaleWidth(15, context)),
            child: CustomText(
              text: "reviews".tr,
              textStyle: CustomTextStyle.textStyle25Bold(
                context,
                color: AppColors.black,
              ),
            ),
          ),

          _productDetailController.productReviews.isEmpty ? CustomText(text: "text", textStyle: CustomTextStyle.textStyle20Bold(context, color: AppColors.black.withOpacity(0.7))) : Container(),

          const SimilarProduct(),
        ],
      ),
    );
  }

  Container _getBookView(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: scaleHeight(36, context),
        bottom: scaleHeight(34, context),
        left: scaleWidth(40, context),
        right: scaleWidth(40, context),
      ),
      decoration: BoxDecoration(
        color: AppColors.orangeLight,
        boxShadow: [primaryBoxShadow()],
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(scaleRadius(20, context))),
      ),
      child: Column(
        children: [
          // Book Image
          ClipRRect(
            borderRadius: BorderRadius.circular(scaleRadius(15, context)),
            child: _productDetailController.productDetailData.value!.featuredImage!.url!.isNotEmpty
                ? CachedNetworkImage(
                    imageUrl: _productDetailController.productDetailData.value!.featuredImage!.url!,
                    height: scaleHeight(300, context),
                    width: scaleWidth(220, context),
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
          const VerticalGap(size: 30),

          // Book Title
          CustomText(
            text: _productDetailController.productDetailData.value!.name,
            textStyle: CustomTextStyle.textStyle30Bold(context),
            maxLines: 3,
          ),
          const VerticalGap(size: 5),

          // Subtitle
          CustomText(
            text: "by_moomal_publication".tr,
            textStyle: CustomTextStyle.textStyle20Bold(context),
          ),
          const VerticalGap(size: 30),

          // Price Quantity View
          PriceQuantity(),
        ],
      ),
    );
  }
}
