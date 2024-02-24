import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_progress_indicator.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class CardImage extends StatelessWidget {
  const CardImage({
    super.key,
    required this.image,
    required this.borderColor,
    this.height,
    this.width,
  });
  final String image;
  final Color borderColor;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.v,
      width: 150.h,
      margin: EdgeInsets.symmetric(
        horizontal: 5.h,
        vertical: 5.v,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.r),
        child: (image.isNotEmpty)
            ? CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.cover,
                placeholder: (context, url) {
                  return Center(child: customProgressIndicator());
                },
              )
            : Container(
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
