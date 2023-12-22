import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/components/organisms/custom_drop_down_2.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/ebook/controller/ebook_controller.dart';
import 'package:moomalpublication/routes/routing.dart';

class EBookScreen extends StatelessWidget {
  EBookScreen({super.key});

  final EbookController ebookController = Get.put(EbookController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppbar(
              title: "E Book",
              prefixIcon: AppAssets.icBackArrow,
              suffixIcon: AppAssets.icSearch,
              onPrefixIconClick: () => AppRouting.navigateBack(),
              maxLine: 1,
            ),
            const VerticalGap(size: 16),
            Column(
              children: [
                CustomDropDown2(
                  borderRadius: 10,
                  borderColor: AppColors.orange,
                  items: ebookController.ebookCategories,
                  selectedItem: ebookController.selectedCategories,
                  width: screenWidth(context) - scaleWidth(40, context),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
