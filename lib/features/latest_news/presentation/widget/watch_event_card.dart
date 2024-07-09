import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/cart/presentation/widgets/shadow_container.dart';
import 'package:moomalpublication/features/latest_news/data/model/latest_news_item1/latest_news_item1/latest_news_item1.dart';
import 'package:moomalpublication/features/quiz/presentation/widgets/card_image.dart';

class WatchEventCard extends StatelessWidget {
  final LatestNewsItem1 latestNewsItem;
  const WatchEventCard(
      {super.key,
      required this.latestNewsItem});

  @override
  Widget build(BuildContext context) {
    return ShadowContainer(
      containerChild: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 12.v),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CardImage(
                image: latestNewsItem.featuredImageUrl ?? "",
                borderColor: AppColors.grey,
              ),
            HorizontalGap(size: 20.h),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Html(data: "<strong>${latestNewsItem.title?.rendered ?? ""}</strong>"),
                  VerticalGap(size: 15.v),
                  GestureDetector(
                    onTap: () {
                      // onClickNews();
                    },
                    child: Container(
                      color: AppColors.originalRed,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16.h, vertical: 5.v),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              AppAssets.icPlay,
                              height: 24.v,
                              width: 24.h,
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
      ),
    );
  }
}
