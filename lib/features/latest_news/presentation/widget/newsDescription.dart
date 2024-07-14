import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/latest_news/controller/latest_news_controller.dart';
import 'package:moomalpublication/features/quiz/presentation/widgets/card_image.dart';

class NewsDescription extends StatelessWidget {
  NewsDescription({
    super.key,
  });

  final LatestNewsController _newsController = Get.find<LatestNewsController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 12.v,
        left: 10.h,
        right: 10.h,
        bottom: 20.v,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CardImage(
              image: _newsController.latestNewsItem.featuredImageUrl ?? '',
              borderColor: AppColors.orange,
              height: 350.adaptSize,
              width: 290.adaptSize,
            ),
          ),
          VerticalGap(size: 18.v),
          Html(
              data:
                  "<strong><h3>${_newsController.latestNewsItem.title?.rendered ?? ""}</h3></strong>"),
          // CustomText(
          //   text: _newsController.latestNewsItem.title?.rendered ?? '',
          //   textStyle: CustomTextStyle.textStyle15Bold(context),
          //   textAlign: TextAlign.start,
          // ),
          // VerticalGap(size: 10.v),
          Html(data: _newsController.latestNewsItem.content?.rendered ?? ''),
          // CustomText(
          //   text: _newsController.latestNewsItem.content?.rendered ?? '',
          //   textStyle: CustomTextStyle.textStyle15Bold(context),
          //   textAlign: TextAlign.start,
          // ),
        ],
      ),
    );
  }
}
