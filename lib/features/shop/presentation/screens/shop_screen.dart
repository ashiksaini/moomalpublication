import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_progress_indicator.dart';
import 'package:moomalpublication/core/components/atoms/refersh_indicator.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/components/organisms/card_book_item.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/theme/shimmer/shimmer_skeleton_book_item.dart';
import 'package:moomalpublication/core/utils/utility.dart';
import 'package:moomalpublication/features/shop/controller/shop_controller.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';

class ShopScreen extends StatelessWidget {
  final ShopController _shopController = Get.put(ShopController());

  ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          backgroundColor: AppColors.black,
          body: SafeArea(
            child: CustomRefreshIndicator(
              onRefreshCallback: () => _shopController.onRefresh(),
              child: Container(
                color: AppColors.white,
                child: Column(
                  children: [
                    // Appbar
                    CustomAppbar(
                      title: "shop".tr,
                      suffixIcon: AppAssets.icSearch,
                      onSuffixIconClick: () =>
                          AppRouting.toNamed(NameRoutes.searchScreen),
                    ),

                    // Data view
                    Expanded(
                      child: GridView.builder(
                        controller: _shopController.scrollController,
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.h,
                          vertical: 10.v,
                        ),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12.0.h,
                          mainAxisSpacing: 15.0.v,
                          childAspectRatio:
                              Utility.getChildAspectRation(context),
                        ),
                        itemCount:
                            _shopController.productResponse.value.isLoading
                                ? 20
                                : _shopController.productList.length,
                        itemBuilder: (context, index) {
                          if (_shopController.productResponse.value.isLoading) {
                            return const BookItemShimmerSkeleton();
                          } else {
                            return GestureDetector(
                              onTap: () {
                                _shopController.onItemClick(
                                    index, _shopController.productList[index]);
                              },
                              child: CardBookItem(
                                item: _shopController.productList[index],
                                onCartBtnClick: _shopController.onCartBtnClick,
                              ),
                            );
                          }
                        },
                      ),
                    ),

                    // Load more
                    if (_shopController.isLoadingMore.value)
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.v),
                        child: customProgressIndicator(),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
