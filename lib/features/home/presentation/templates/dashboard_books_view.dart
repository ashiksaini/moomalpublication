import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/components/organisms/card_book_item.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/theme/shimmer/shimmer_skeleton_book_item.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/core/base/product_item/product_item.dart';
import 'package:moomalpublication/features/home/controllers/home_controller.dart';

class DashboardBooksView extends StatelessWidget {
  final String title;
  final int loadingItemCount;
  final bool isLoading;
  final List<ProductItem> data;
  final HomeController _homeController = Get.find<HomeController>();

  DashboardBooksView({
    super.key,
    required this.title,
    required this.loadingItemCount,
    required this.isLoading,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        const VerticalGap(size: 15),
        _getTitle(context, title),

        // Books View
        const VerticalGap(size: 10),
        _getBooksBuilder(context, loadingItemCount, isLoading, data),
      ],
    );
  }

  Widget _getTitle(BuildContext context, String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: scaleWidth(20, context)),
      child: CustomText(
        text: title,
        textStyle:
            CustomTextStyle.textStyle25Bold(context, color: AppColors.black),
      ),
    );
  }

  Widget _getBooksBuilder(BuildContext context, int loadingItemCount,
      bool isLoading, List<ProductItem> data) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: scaleWidth(10, context),
        vertical: scaleHeight(10, context),
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 15.0,
        childAspectRatio: isLoading ? 0.58 : 0.5,
      ),
      itemCount: isLoading ? loadingItemCount : data.length,
      itemBuilder: (context, index) {
        if (isLoading) {
          return const BookItemShimmerSkeleton();
        } else {
          return GestureDetector(
            onTap: () {
              _homeController.onItemClick(index, data[index]);
            },
            child: CardBookItem(item: data[index], onCartBtnClick: _homeController.onCartBtnClick,),
          );
        }
      },
    );
  }
}
