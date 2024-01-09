import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_progress_indicator.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/components/organisms/card_book_item.dart';
import 'package:moomalpublication/core/components/organisms/custom_drop_down_2.dart';
import 'package:moomalpublication/core/components/organisms/empty_product.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/theme/shimmer/shimmer_skeleton_book_item.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/ebook/controller/ebook_controller.dart';
import 'package:moomalpublication/features/ebook/data/models/e_book_category_item/e_book_category_item.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';

class EBookScreen extends StatelessWidget {
  EBookScreen({super.key});

  final EbookController _ebookController = Get.put(EbookController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Obx(() {
          return Column(
            children: [
              CustomAppbar(
                title: "ebooks".tr,
                suffixIcon: AppAssets.icSearch,
                onSuffixIconClick: () =>
                    AppRouting.toNamed(NameRoutes.searchScreen),
              ),
              _ebookController.ebookCategoryResponse.value.isLoading ||
                      _ebookController.ebooksResponse.value.isLoading
                  ? _showLoading(context)
                  : _showData(context),
            ],
          );
        }),
      ),
    );
  }

  Widget _showData(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const VerticalGap(size: 16),
          // Category Drop down
          CustomDropDown2<EBookCategoryItem>(
            borderRadius: 10,
            borderColor: AppColors.orange,
            items: _ebookController.ebookCategories,
            selectedItem: _ebookController.selectedCategory,
            onItemClick: _ebookController.onCategoryItemClick,
            width: screenWidth(context) - scaleWidth(20, context),
          ),
          const VerticalGap(size: 4),

          // Data view
          if (_ebookController.ebooks.isEmpty) ...{
            const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [EmptyProductView()],
              ),
            )
          } else
            Expanded(
              child: GridView.builder(
                controller: _ebookController.scrollController,
                padding: EdgeInsets.symmetric(
                  horizontal: scaleWidth(10, context),
                  vertical: scaleHeight(12, context),
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 15.0,
                  childAspectRatio:
                      _ebookController.ebooksResponse.value.isLoading
                          ? 0.58
                          : 0.46,
                ),
                itemCount: _ebookController.ebooksResponse.value.isLoading
                    ? 20
                    : _ebookController.ebooks.length,
                itemBuilder: (context, index) {
                  if (_ebookController.ebooksResponse.value.isLoading) {
                    return const BookItemShimmerSkeleton();
                  } else {
                    return GestureDetector(
                      onTap: () {
                        _ebookController.onItemClick(
                            index, _ebookController.ebooks[index]);
                      },
                      child: CardBookItem(
                        item: _ebookController.ebooks[index],
                        onCartBtnClick: _ebookController.onCartBtnClick,
                      ),
                    );
                  }
                },
              ),
            ),

          // Load more
          if (_ebookController.isLoadingMore.value)
            Padding(
              padding: EdgeInsets.symmetric(vertical: scaleHeight(10, context)),
              child: customProgressIndicator(),
            ),
        ],
      ),
    );
  }

  Widget _showLoading(BuildContext context) {
    return Expanded(child: Center(child: customProgressIndicator()));
  }
}
