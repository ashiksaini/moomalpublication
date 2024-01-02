import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/quiz/controller/quiz_controller.dart';

class OptionsCard extends StatelessWidget {
  OptionsCard(
      {super.key, required this.optionNumber, required this.questionNumber});

  final QuizController _quizController = Get.find<QuizController>();
  final int optionNumber;
  final int questionNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Obx(
          () => Container(
            decoration: BoxDecoration(
              color: _quizController.selectedOptions[questionNumber].value == -1
                  ? AppColors.greyLight
                  : _quizController.selectedOptions[questionNumber].value ==
                          optionNumber
                      ? AppColors.orange
                      : AppColors.greyLight,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: EdgeInsets.all(scaleWidth(6, context)),
              child: CustomText(
                  text: _quizController.optionsName[optionNumber],
                  textStyle: CustomTextStyle.textStyle16MediumTrio(context)),
            ),
          ),
        ),
      ],
    );
  }
}
