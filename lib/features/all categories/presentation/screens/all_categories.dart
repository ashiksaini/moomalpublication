import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/components/organisms/card_book_item.dart';
import 'package:moomalpublication/core/components/templates/screen.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/all%20categories/presentation/widgets/category.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Screen(
      child: Column(
        children: [
          const CustomAppbar(
            title: "All Categories",
            prefixIcon: AppAssets.icBackArrow,
            suffixIcon: AppAssets.icSearch,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: scaleHeight(30, context), horizontal: scaleWidth(24, context)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoryItem(icon: AppAssets.icReadingBook, title: "current_gk".tr),
                    CategoryItem(icon: AppAssets.icUserboard, title: "current_gk".tr),
                    CategoryItem(icon: AppAssets.icClipboard, title: "current_gk".tr),
                  ],
                ),
                const VerticalGap(size: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoryItem(icon: AppAssets.icEdit, title: "current_gk".tr),
                    CategoryItem(icon: AppAssets.icOpenBook, title: "current_gk".tr),
                    CategoryItem(icon: AppAssets.icReport, title: "current_gk".tr),
                  ],
                )
              ],
            ),
          ),
          _getBooksBuilder(context, 10)
        ],
      ),
    );
  }

  Widget _getBooksBuilder(BuildContext context, int itemCount) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: scaleWidth(10, context)),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 15.0,
          childAspectRatio: 0.49,
        ),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return const CardBookItem();
        },
      ),
    );
  }
}
