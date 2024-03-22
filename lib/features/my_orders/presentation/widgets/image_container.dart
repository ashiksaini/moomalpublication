import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 109.adaptSize,
      width: 84.adaptSize,
      margin: EdgeInsets.symmetric(horizontal: 5.h, vertical: 5.v),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.r),
        child:
            // (item.featuredImage?.url != null &&
            //         item.featuredImage!.url!.isNotEmpty)
            //     ? CachedNetworkImage(
            //         imageUrl: item.featuredImage!.url!,
            //         fit: BoxFit.contain,
            //         placeholder: (context, url) {
            //           return Center(child: customProgressIndicator());
            //         },
            //       )
            // :
            Container(
          width: SizeUtils.width,
          color: AppColors.greyLight,
          child: Center(
            child: CustomText(
              text: "no_image_preview_available".tr,
              textStyle: CustomTextStyle.textStyle10Bold(context,
                  color: AppColors.black),
            ),
          ),
        ),
      ),
    );
  }
}
