import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_progress_indicator.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';

class WatchEventCard extends StatelessWidget {
  final String newsThumbnail;
  final String newsText;
  final Function onClickNews;
  const WatchEventCard(
      {super.key,
      required this.newsThumbnail,
      required this.newsText,
      required this.onClickNews});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 12.v),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CachedNetworkImage(
            imageUrl: newsThumbnail,
            fit: BoxFit.cover,
            height: 90.h,
            width: 130.h,
            placeholder: (context, url) {
              return Center(child: customProgressIndicator());
            },
          ),
          HorizontalGap(size: 20.h),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  textAlign: TextAlign.start,
                  text: newsText,
                  textStyle: CustomTextStyle.textStyle22Bold(context,
                      color: AppColors.black),
                ),
                VerticalGap(size: 8.v),
                GestureDetector(
                  onTap: () {
                    onClickNews();
                  },
                  child: Container(
                    color: AppColors.originalRed,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.v),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            AppAssets.icPlay,
                            height: 32.v,
                            width: 32.h,
                            color: AppColors.white,
                          ),
                          HorizontalGap(size: 6.h),
                          CustomText(
                            text: "watch".tr,
                            textStyle: CustomTextStyle.textStyle22Bold(context,
                                color: AppColors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
