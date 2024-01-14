import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/product_detail/controller/product_detail_controller.dart';

class BookTypeGrid extends StatelessWidget {
  BookTypeGrid({super.key});

  final ProductDetailController _productDetailController = Get.find<ProductDetailController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: scaleWidth(15, context),
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.4,
        ),
        itemBuilder: (_, index) {
          if (index == 0) {
            return _getBookDetailItem(
              context,
              "book".tr,
              _productDetailController.productDetailData.value!.isBookAvailable ? "available".tr : "not_available".tr,
              textColor: AppColors.black,
            );
          }
          if (index == 1) {
            return _getBookDetailItem(
              context,
              "ebook".tr,
              _productDetailController.productDetailData.value!.isEbookAvailable ? "available".tr : "not_available".tr,
              textColor: AppColors.black,
            );
          }
          if (index == 2) {
            return _getBookDetailItem(
              context,
              "sku".tr,
              _productDetailController.sku.value,
            );
          }
          if (index == 3) {
            return _getBookDetailItem(
              context,
              "categories".tr,
              _productDetailController.categories.value,
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _getBookDetailItem(
    BuildContext context,
    String title,
    String subtitle, {
    Color textColor = AppColors.grey,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey),
      ),
      padding: EdgeInsets.symmetric(
        vertical: scaleHeight(15, context),
        horizontal: scaleWidth(15, context),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Title
          CustomText(
            text: title,
            textStyle: CustomTextStyle.textStyle20Bold(context, color: textColor),
          ),

          // SubTitle
          CustomText(
            maxLines: 2,
            text: subtitle,
            textStyle: CustomTextStyle.textStyle20Bold(context, color: textColor),
          ),
        ],
      ),
    );
  }
}
