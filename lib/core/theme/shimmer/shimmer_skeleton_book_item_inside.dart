import 'package:flutter/material.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:shimmer/shimmer.dart';

class BookItemCardShimmerSkeleton extends StatelessWidget {
  const BookItemCardShimmerSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image view
          _imageView(context),

          // Book Detail
          Padding(
            padding: EdgeInsets.only(
              left: scaleWidth(15, context),
              right: scaleWidth(15, context),
              bottom: scaleHeight(10, context),
              top: scaleHeight(5, context),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius:
                        BorderRadius.circular(scaleRadius(15, context)),
                  ),
                  height: scaleHeight(15, context),
                ),
                const VerticalGap(size: 4),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius:
                        BorderRadius.circular(scaleRadius(15, context)),
                  ),
                  height: scaleHeight(15, context),
                  width: scaleWidth(100, context),
                ),
                const VerticalGap(size: 10),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius:
                        BorderRadius.circular(scaleRadius(15, context)),
                  ),
                  height: scaleHeight(20, context),
                  width: scaleWidth(70, context),
                ),
                const VerticalGap(size: 10),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius:
                          BorderRadius.circular(scaleRadius(5, context)),
                    ),
                    height: scaleHeight(30, context),
                    width: scaleWidth(120, context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageView(BuildContext context) {
    return Container(
      height: scaleHeight(150, context),
      margin: EdgeInsets.symmetric(
        horizontal: scaleWidth(5, context),
        vertical: scaleHeight(5, context),
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(scaleRadius(15, context)),
      ),
    );
  }
}
