import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/bottom_sheets/filter_bottom_sheet.dart';
import 'package:moomalpublication/core/components/atoms/custom_progress_indicator.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/components/atoms/refersh_indicator.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/components/organisms/card_book_item.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/box_shadows.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/theme/shimmer/shimmer_skeleton_book_item.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';
import 'package:moomalpublication/core/utils/utility.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/all_categories/controller/category_wise_controller.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';

class CategoryWiseScreen extends StatelessWidget {
  CategoryWiseScreen({super.key});

  final CategoryWiseController _categoryWiseController =
      Get.put(CategoryWiseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Obx(() {
          return Container(
            color: AppColors.white,
            child: Column(
              children: [
                _getUpperView(context),
                const VerticalGap(size: 2),

                // Data view
                _getDataView(context),

                // Load more
                if (_categoryWiseController.isLoadingMore.value)
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.v),
                    child: customProgressIndicator(),
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _getDataView(BuildContext context) {
    return Expanded(
      child: CustomRefreshIndicator(
        onRefreshCallback: () => _categoryWiseController.onRefresh(),
        child: GridView.builder(
          controller: _categoryWiseController.scrollController,
          padding: EdgeInsets.symmetric(
            horizontal: 10.h,
            vertical: 10.v,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 15.0,
            childAspectRatio: Utility.getChildAspectRation(context),
          ),
          itemCount: _categoryWiseController.productResponse.value.isLoading
              ? 20
              : _categoryWiseController.productList.length,
          itemBuilder: (context, index) {
            if (_categoryWiseController.productResponse.value.isLoading) {
              return const BookItemShimmerSkeleton();
            } else {
              return GestureDetector(
                onTap: () {
                  _categoryWiseController.onItemClick(
                      index, _categoryWiseController.productList[index]);
                },
                child: CardBookItem(
                  item: _categoryWiseController.productList[index],
                  onCartBtnClick: _categoryWiseController.onCartBtnClick,
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _getUpperView(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 110.v,
          padding: EdgeInsets.symmetric(
            horizontal: 12.h,
            vertical: 15.v,
          ),
          decoration: BoxDecoration(
              color: AppColors.greyLight,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.r),
                bottomRight: Radius.circular(10.r),
              ),
              boxShadow: [primaryBoxShadow()]),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Include out of stock items
              _getStockStatusView(context),

              // Filter btn
              _getFilterBtn(context)
            ],
          ),
        ),
        _getAppBar(),
      ],
    );
  }

  Row _getStockStatusView(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 24.v,
          width: 24.h,
          child: Checkbox(
            side: const BorderSide(color: AppColors.white),
            checkColor: AppColors.orange,
            activeColor: AppColors.white,
            value: _categoryWiseController.includeOutOfStockItem.value,
            onChanged: (value) =>
                _categoryWiseController.canIncludeOutOfStockItem(value),
          ),
        ),
        const HorizontalGap(size: 4),
        CustomText(
          text: "include_out_of_stock_item".tr,
          textStyle: CustomTextStyle.textStyle18Regular(context,
              color: AppColors.black),
        ),
      ],
    );
  }

  Widget _getAppBar() {
    return CustomAppbar(
      title: _categoryWiseController.sharedData.categoryWiseAppBarTitle ?? "",
      prefixIcon: AppAssets.icBackArrow,
      onPrefixIconClick: () => AppRouting.navigateBack(),
      suffixIcon: AppAssets.icSearch,
      onSuffixIconClick: () => AppRouting.toNamed(NameRoutes.searchScreen),
    );
  }

  Widget _getFilterBtn(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (_) {
            return Wrap(
              children: [
                FiltersBottomSheet(
                  selectedSortBy: _categoryWiseController.selectedSortBy,
                  onClick: _categoryWiseController.onFilterItemClick,
                )
              ],
            );
          },
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [primaryBoxShadow()],
        ),
        child: Row(
          children: [
            SvgPicture.asset(AppAssets.icFilter2),
            CustomText(
              text: "filter".tr,
              textStyle: CustomTextStyle.textStyle18Bold(context,
                  color: AppColors.black),
            )
          ],
        ),
      ),
    );
  }
}
