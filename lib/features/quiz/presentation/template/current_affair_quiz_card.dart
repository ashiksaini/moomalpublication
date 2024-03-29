import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/app_constants.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/date_time_utils.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/cart/presentation/widgets/shadow_container.dart';
import 'package:moomalpublication/features/quiz/controller/quiz_controller.dart';
import 'package:moomalpublication/features/quiz/presentation/widgets/card_image.dart';

class CurrentAffairQuizCard extends StatelessWidget {
  CurrentAffairQuizCard({super.key, required this.index});
  final int index;
  final QuizController _quizController = Get.find<QuizController>();

  @override
  Widget build(BuildContext context) {
    String date = DateTimeUtils.formatDate(
      date: _quizController.quizList[index].lastActivity!,
      formatType: AppConstants.dateFormatter,
    );

    return GestureDetector(
      onTap: () {
        _quizController.navigateQuizDetailScreen(index: index);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 16.v,
          horizontal: 8.h,
        ),
        child: ShadowContainer(
          containerChild: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 16.v,
              horizontal: 14.h,
            ),
            child: Row(
              children: [
                CardImage(
                  image: "",
                  borderColor: AppColors.blue,
                  height: 130.v,
                ),
                HorizontalGap(size: 12.h),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          textAlign: TextAlign.left,
                          text: _quizController.quizList[index].quizName,
                          maxLines: 4,
                          textStyle: CustomTextStyle.textStyle20Bold(
                            context,
                            color: AppColors.black,
                          ),
                        ),
                        VerticalGap(size: 8.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(AppAssets.icUser1),
                            HorizontalGap(size: 8.h),
                            Flexible(
                              child: CustomText(
                                textAlign: TextAlign.start,
                                text: "${'admin'.tr}, $date",
                                textStyle: CustomTextStyle.textStyle20Bold(
                                  context,
                                  color: AppColors.greyLight,
                                ),
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                        VerticalGap(size: 20.h),
                        CustomText(
                          text:
                              "${'quiz_views'.tr}: ${_quizController.quizList[index].quizViews}",
                          textStyle: CustomTextStyle.textStyle15Bold(
                            context,
                            color: AppColors.black,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        CustomText(
                          text:
                              "${'quiz_taken'.tr}: ${_quizController.quizList[index].quizTaken}",
                          textStyle: CustomTextStyle.textStyle15Bold(
                            context,
                            color: AppColors.black,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          borderRadius: 10,
          borderColor: AppColors.orange,
        ),
      ),
    );
  }
}
