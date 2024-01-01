import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/components/organisms/card_book_item.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/theme/shimmer/shimmer_skeleton_book_item.dart';
import 'package:moomalpublication/core/utils/shared_data.dart';
import 'package:moomalpublication/features/product_detail/controller/product_detail_controller.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';

class SimilarProductScreen extends StatelessWidget {
  SimilarProductScreen({super.key});

  final ProductDetailController _productDetailController =
      Get.put(ProductDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppbar(
              title: "similar_products".tr,
              prefixIcon: AppAssets.icBackArrow,
              onPrefixIconClick: () => AppRouting.navigateBack(),
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(
                  horizontal: scaleWidth(10, context),
                  vertical: scaleHeight(10, context),
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 15.0,
                  childAspectRatio: _productDetailController
                          .similarProductResponse.value.isLoading
                      ? 0.58
                      : 0.5,
                ),
                itemCount: _productDetailController
                        .similarProductResponse.value.isLoading
                    ? 10
                    : _productDetailController.similarProducts.length,
                itemBuilder: (context, index) {
                  if (_productDetailController
                      .similarProductResponse.value.isLoading) {
                    return const BookItemShimmerSkeleton();
                  } else {
                    return GestureDetector(
                      onTap: () {
                        AppRouting.ofNamedUntil(
                            NameRoutes.moomalpublicationApp);
                        AppRouting.toNamed(
                          NameRoutes.productDetailScreen,
                          argument: SharedData(
                              productItem: _productDetailController
                                  .similarProducts[index]),
                        );
                      },
                      child: CardBookItem(
                        item: _productDetailController.similarProducts[index],
                        onCartBtnClick: _productDetailController.onCartBtnClick,
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
