import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/product_detail/controller/product_detail_controller.dart';
import 'package:moomalpublication/features/product_detail/presentation/widgets/rating_bar.dart';

class ReviewBottomSheet extends StatelessWidget {
  ReviewBottomSheet({super.key});

  final ProductDetailController _productDetailController =
      Get.find<ProductDetailController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          width: SizeUtils.width,
          padding: EdgeInsets.symmetric(
            vertical: 14.v,
            horizontal: 14.h,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r),
              topRight: Radius.circular(10.r),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Rating
              _getRatingView(context),

              /// Review
              _getWriteReview(context),

              /// Submit Btn
              _getSubmitBtn(context),
            ],
          ),
        ),
      );
    });
  }

  Widget _getRatingView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "your_rating".tr,
          textStyle:
              CustomTextStyle.textStyle18Bold(context, color: AppColors.black),
          textAlign: TextAlign.start,
        ),
        const VerticalGap(size: 10),
        StarRatingBar(
          itemSize: 20,
          onRatingUpdate: _productDetailController.onRatingUpdate,
        ),
        const VerticalGap(size: 20),
      ],
    );
  }

  Widget _getWriteReview(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "your_review".tr,
          textStyle:
              CustomTextStyle.textStyle18Bold(context, color: AppColors.black),
          textAlign: TextAlign.start,
        ),
        const VerticalGap(size: 10),
        SizedBox(
          height: 150.v,
          child: TextFormField(
            controller:
                _productDetailController.writeReviewTextEditingController,
            maxLines: 10,
            keyboardType: TextInputType.multiline,
            cursorColor: AppColors.orange,
            cursorWidth: 2.h,
            cursorRadius: Radius.circular(2.r),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.grey),
                borderRadius: BorderRadius.circular(4.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.r),
                borderSide: const BorderSide(color: AppColors.orangeDark),
              ),
            ),
          ),
        ),
        const VerticalGap(size: 30),
      ],
    );
  }

  Widget _getSubmitBtn(BuildContext context) {
    return GestureDetector(
      onTap: () => _productDetailController.onReviewSubmit(),
      child: Container(
        width: SizeUtils.width,
        color: AppColors.orange,
        child: _productDetailController.postReviewResponse.value.isLoading
            ? Center(
                child: LottieBuilder.asset(
                  AppAssets.loadingAnimation,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                  height: 44.v,
                ),
              )
            : CustomText(
                text: "submit".tr,
                textStyle: CustomTextStyle.textStyle22Bold(context,
                    color: AppColors.white),
              ).paddingSymmetric(vertical: 8.v),
      ),
    );
  }
}
