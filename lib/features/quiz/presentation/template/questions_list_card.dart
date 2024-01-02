import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/quiz/controller/quiz_controller.dart';
import 'package:moomalpublication/features/quiz/presentation/widgets/options_card.dart';

class QuestionListCard extends StatelessWidget {
  QuestionListCard({super.key, required this.questionNumberIndex});
  final int questionNumberIndex;

  final QuizController _quizController = Get.find<QuizController>();
  // final QuizController _quizController = Get.put(QuizController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: scaleHeight(28, context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            textAlign: TextAlign.start,
            text:
                '${(questionNumberIndex + 1).toString()}. ${_quizController.questionsList[questionNumberIndex]}',
            textStyle: CustomTextStyle.textStyle15Bold(context),
          ),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _quizController.optionsName.length,
              itemBuilder: (context, optionIndex) {
                return GestureDetector(
                  onTap: () {
                    _quizController.selectedOption(
                        questionNumber: questionNumberIndex,
                        optionNumber: optionIndex);
                  },
                  child: OptionsCard(
                      questionNumber: questionNumberIndex,
                      optionNumber: optionIndex),
                );
              }),
        ],
      ),
    );
  }
}
