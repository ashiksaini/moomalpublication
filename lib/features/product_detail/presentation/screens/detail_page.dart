import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/templates/screen.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/features/product_detail/controller/product_detail_controller.dart';
import 'package:moomalpublication/features/product_detail/presentation/templates/detail_container.dart';
import 'package:moomalpublication/routes/routing.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductDetailController _productDetailController =
      Get.put(ProductDetailController());
  ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Screen(
        screenBg: AppColors.orangeLight,
        prefixIcon: AppAssets.icBackArrow,
        suffixIcon: AppAssets.icShare,
        onPrefixIconClick: () => AppRouting.navigateBack(),
        appBarTitle: _productDetailController.productName.value,
        child: DetailContainer(),
      );
    });
  }
}
