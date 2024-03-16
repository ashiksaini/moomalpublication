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
              left: 15.h,
              right: 15.h,
              bottom: 10.v,
              top: 5.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  height: 15.v,
                ),
                const VerticalGap(size: 4),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  height: 15.v,
                  width: 100.h,
                ),
                const VerticalGap(size: 10),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  height: 20.v,
                  width: 70.h,
                ),
                const VerticalGap(size: 10),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  height: 20.v,
                ),
                const VerticalGap(size: 10),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    height: 30.v,
                    width: 120.h,
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
      height: 150.v,
      margin: EdgeInsets.symmetric(
        horizontal: 5.h,
        vertical: 5.v,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
    );
  }
}
