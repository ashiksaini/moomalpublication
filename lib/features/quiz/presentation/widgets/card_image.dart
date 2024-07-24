import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/components/atoms/custom_progress_indicator.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class CardImage extends StatelessWidget {
  const CardImage({
    super.key,
    required this.image,
    required this.borderColor,
    this.height,
    this.width,
    this.borderRadius,
  });
  final String image;
  final Color borderColor;
  final double? height;
  final double? width;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 170.adaptSize,
      width: width ?? 150.adaptSize,
      margin: EdgeInsets.symmetric(
        horizontal: 5.h,
        vertical: 5.v,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius ?? 15.r),
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
                color: Colors.grey.shade100,
                child: Center(
                  child: Center(
                    child: SvgPicture.asset(
                      AppAssets.icLogo,
                      height: 50.v,
                      width: 50.h,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
