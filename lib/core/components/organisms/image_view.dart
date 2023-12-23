import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_progress_indicator.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class ImageView extends StatelessWidget {
  const ImageView({super.key, this.image, this.height});
  final String? image;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: EdgeInsets.symmetric(
          horizontal: scaleWidth(5, context),
          vertical: scaleHeight(5, context)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(scaleRadius(15, context)),
        child: (image != null && image!.isNotEmpty)
            ? CachedNetworkImage(
                imageUrl: image!,
                fit: BoxFit.cover,
                placeholder: (context, url) {
                  return Center(child: customProgressIndicator());
                },
              )
            : Container(
                width: screenWidth(context),
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
