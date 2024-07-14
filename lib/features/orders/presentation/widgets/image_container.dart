import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/components/atoms/custom_progress_indicator.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class ImageContainer extends StatelessWidget {
  final String? image;
  final double? height;
  final double? width;

  const ImageContainer(
      {super.key, required this.image, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 150.adaptSize,
      width: width ?? 120.adaptSize,
      margin: EdgeInsets.symmetric(horizontal: 5.h, vertical: 5.v),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.r),
        child: (image != null && image != '')
            ? CachedNetworkImage(
                imageUrl: image!,
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
