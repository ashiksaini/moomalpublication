import 'package:flutter/material.dart';
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
    String date = DateTimeUtils.formatDate(date: _quizController.quizList[index].lastActivity!, formatType: AppConstants.dateFormatter); // ask where to use this
    return GestureDetector(
      onTap: () {
        _quizController.navigateQuizDetailScreen(index: index);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: scaleHeight(16, context), horizontal: scaleWidth(8, context)),
        child: ShadowContainer(
          containerChild: Padding(
            padding: EdgeInsets.symmetric(vertical: scaleHeight(16, context), horizontal: scaleWidth(14, context)),
            child: Row(
              children: [
                CardImage(
                  image: AppAssets.bookPng,
                  borderColor: AppColors.blue,
                  height: scaleHeight(130, context),
                ),
                const HorizontalGap(size: 12),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: scaleWidth(12, context)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          textAlign: TextAlign.left,
                          text: _quizController.quizList[index].quizName,
                          maxLines: 4,
                          textStyle: CustomTextStyle.textStyle20Bold(context, color: AppColors.black),
                        ),
                        const VerticalGap(size: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(AppAssets.icAdmin),
                            const HorizontalGap(size: 8),
                            Flexible(
                              child: CustomText(
                                textAlign: TextAlign.start,
                                text: "Admin, $date",
                                textStyle: CustomTextStyle.textStyle20Bold(context, color: AppColors.greyLight),
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                        const VerticalGap(size: 20),
                        CustomText(
                          text: "Quiz Views: ${_quizController.quizList[index].quizViews}",
                          textStyle: CustomTextStyle.textStyle15Bold(context, color: AppColors.black),
                          textAlign: TextAlign.start,
                        ),
                        CustomText(
                          text: "Quiz Taken: ${_quizController.quizList[index].quizTaken}",
                          textStyle: CustomTextStyle.textStyle15Bold(context, color: AppColors.black),
                          textAlign: TextAlign.start,
                        ),
                        // const VerticalGap(size: 9),
                        // if (quatintyButton) const QuantityButton(),
                        // if (addButton) const AddButton(),
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
