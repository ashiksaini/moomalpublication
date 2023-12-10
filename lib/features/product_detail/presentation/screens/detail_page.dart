import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/features/product_detail/controller/product_detail_controller.dart';
import 'package:moomalpublication/features/product_detail/presentation/templates/detail_container.dart';
import 'package:moomalpublication/features/product_detail/presentation/widgets/pair_btn.dart';
import 'package:moomalpublication/routes/routing.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductDetailController _productDetailController = Get.put(ProductDetailController());
  ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  CustomAppbar(
                    prefixIcon: AppAssets.icBackArrow,
                    suffixIcon: AppAssets.icShare,
                    onPrefixIconClick: () => AppRouting.navigateBack(),
                    title: _productDetailController.productName.value,
                    maxLine: 1,
                  ),
                  Expanded(child: DetailContainer())
                ],
              ),
              const Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: PairBuyBtn(),
              ),
            ],
          ),
        ),
      );
    });
  }
}
