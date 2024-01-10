import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/components/organisms/card_book_item.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/theme/shimmer/shimmer_skeleton_book_item.dart';
import 'package:moomalpublication/features/product_detail/controller/product_detail_controller.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';

class SimilarProduct extends StatelessWidget {
  SimilarProduct({super.key});

  final ProductDetailController _productDetailController =
      Get.find<ProductDetailController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => AppRouting.toNamed(NameRoutes.similarProductScreen,
              argument: _productDetailController.sharedData),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: scaleWidth(15, context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  textAlign: TextAlign.left,
                  text: "similar_products".tr,
                  textStyle: CustomTextStyle.textStyle25Bold(context,
                      color: AppColors.black),
                ),
                SvgPicture.asset(
                  AppAssets.icForwardArrow,
                  colorFilter:
                      const ColorFilter.mode(AppColors.black, BlendMode.srcIn),
                )
              ],
            ),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: scaleWidth(10, context),
            vertical: scaleHeight(10, context),
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 15.0,
            childAspectRatio:
                _productDetailController.similarProductResponse.value.isLoading
                    ? 0.52
                    : 0.44,
          ),
          itemCount: 4,
          itemBuilder: (context, index) {
            if (_productDetailController
                .similarProductResponse.value.isLoading) {
              return const BookItemShimmerSkeleton();
            } else {
              return GestureDetector(
                onTap: () {
                  _productDetailController.onItemClick(
                      index, _productDetailController.similarProducts[index]);
                },
                child: CardBookItem(
                  item: _productDetailController.similarProducts[index],
                  onCartBtnClick: _productDetailController.onCartBtnClick,
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
