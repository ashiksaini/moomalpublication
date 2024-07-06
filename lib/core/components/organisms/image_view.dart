import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moomalpublication/core/components/atoms/custom_progress_indicator.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class ImageView extends StatelessWidget {
  const ImageView({super.key, this.image, this.height});
  final String? image;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: EdgeInsets.symmetric(horizontal: 5.h, vertical: 5.v),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.r),
        child: (image != null && image!.isNotEmpty)
            ? CachedNetworkImage(
                imageUrl: image!,
                fit: BoxFit.contain,
                placeholder: (context, url) {
                  return Center(child: customProgressIndicator());
                },
              )
            : Container(
                width: SizeUtils.width,
                color: Colors.grey.shade100,
                child: Center(
                  child: Center(
                      child: SvgPicture.asset(AppAssets.icLogo, height: 50.v, width: 50.h,),
                    ),
                ),
              ),
      ),
    );
  }
}
