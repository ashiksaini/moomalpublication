import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/latest_news/controller/latest_news_controller.dart';
import 'package:moomalpublication/features/quiz/presentation/widgets/card_image.dart';

class NewsDescription extends StatelessWidget {
  NewsDescription({
    super.key,
    required this.index,
  });
  final int index;
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
              image:
                  _newsController.latestNewsItem.featuredImage?.thumbnail ?? '',
              borderColor: AppColors.orange,
            ),
          ),
          VerticalGap(size: 18.v),
          // CustomText(
          //   text: "${'name'.tr}: ${_quizController.quizList[index].quizName}",
          //   textStyle: CustomTextStyle.textStyle15Bold(context),
          //   textAlign: TextAlign.start,
          // ),
          // CustomText(
          //   text:
          //       "${'quiz_views'.tr}: ${_quizController.quizList[index].quizViews}",
          //   textStyle: CustomTextStyle.textStyle15Bold(context),
          //   textAlign: TextAlign.start,
          // ),
          // CustomText(
          //   text:
          //       "${'quiz_taken'.tr}: ${_quizController.quizList[index].quizTaken}",
          //   textStyle: CustomTextStyle.textStyle15Bold(context),
          //   textAlign: TextAlign.start,
          // ),
          // VerticalGap(size: 18.v),
        ],
      ),
    );
  }
}
