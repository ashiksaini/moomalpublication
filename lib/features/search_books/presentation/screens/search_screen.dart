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
import 'package:moomalpublication/core/theme/text_fields.dart';
import 'package:moomalpublication/core/utils/utility.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/search_books/controller/search_product_controller.dart';
import 'package:moomalpublication/routes/routing.dart';

class SearchProductScreen extends StatelessWidget {
  SearchProductScreen({super.key});

  final SearchProductController _searchProductController =
      Get.put(SearchProductController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: AppColors.black,
        body: Container(
          color: AppColors.white,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 100.v,
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.r),
                        bottomRight: Radius.circular(20.r),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.h,
                      ),
                      child: customTextFormField(
                        context,
                        _searchProductController.textEditingController,
                        prefixIcon: AppAssets.icBackSmall,
                        onPrefixIconClick: () => AppRouting.navigateBack(),
                        suffixIcon: AppAssets.icClose,
                        onSuffixIconClick: () {
                          _searchProductController.textEditingController
                              .clear();
                          _searchProductController.searchedBooks.clear();
                        },
                        hint: "search_for_books_and_ebooks".tr,
                        hintTextStyle: CustomTextStyle.textStyle15Bold(context),
                        onTextChange: _searchProductController.onTextChanged,
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: _searchProductController.searchedBooks.isNotEmpty ||
                        _searchProductController
                            .searchBookResponse.value.isLoading
                    ? _getBooksDataView(context)
                    : _getCenterSearchView(context),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _getBooksDataView(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: 10.h,
        vertical: 10.v,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0.h,
        mainAxisSpacing: 15.0.v,
        childAspectRatio: Utility.getChildAspectRation(context),
      ),
      itemCount: _searchProductController.searchBookResponse.value.isLoading
          ? 20
          : _searchProductController.searchedBooks.length,
      itemBuilder: (context, index) {
        if (_searchProductController.searchBookResponse.value.isLoading) {
          return const BookItemShimmerSkeleton();
        } else {
          return GestureDetector(
            onTap: () {
              _searchProductController.onItemClick(
                  index, _searchProductController.searchedBooks[index]);
            },
            child: CardBookItem(
              item: _searchProductController.searchedBooks[index],
              onCartBtnClick: _searchProductController.onCartBtnClick,
            ),
          );
        }
      },
    );
  }

  Widget _getCenterSearchView(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 150.v),
      child: Column(
        children: [
          SvgPicture.asset(
            AppAssets.icSearchScreenBg,
            height: 190.v,
            width: 200.h,
          ),
          const VerticalGap(size: 67),
          CustomText(
            text: "search_in_moomal_publication".tr,
            textStyle: CustomTextStyle.textStyle20Bold(context,
                color: AppColors.black),
          ),
          const VerticalGap(size: 10),
          CustomText(
            text: "search_desc".tr,
            textStyle: CustomTextStyle.textStyle15Bold(context),
          ),
        ],
      ),
    );
  }
}
