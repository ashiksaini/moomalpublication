import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/quiz/controller/quiz_controller.dart';
import 'package:moomalpublication/features/quiz/presentation/widgets/card_image.dart';
import 'package:moomalpublication/features/quiz/presentation/widgets/start_button.dart';

class PhotoDescription extends StatelessWidget {
  PhotoDescription({
    super.key,
    required this.index,
  });
  final QuizController _quizController = Get.find<QuizController>();
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: scaleHeight(12, context),
          left: scaleHeight(10, context),
          right: scaleHeight(10, context),
          bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: CardImage(
              image: AppAssets.bookPng,
              borderColor: AppColors.orange,
            ),
          ),
          const VerticalGap(size: 18),
          CustomText(
            text: "Name: ${_quizController.quizList[index].quizName}",
            textStyle: CustomTextStyle.textStyle15Bold(
              context,
            ),
            textAlign: TextAlign.start,
          ),
          CustomText(
            text: "Quiz Views: ${_quizController.quizList[index].quizViews}",
            textStyle: CustomTextStyle.textStyle15Bold(
              context,
            ),
            textAlign: TextAlign.start,
          ),
          CustomText(
            text: "Quiz Taken: ${_quizController.quizList[index].quizTaken}",
            textStyle: CustomTextStyle.textStyle15Bold(
              context,
            ),
            textAlign: TextAlign.start,
          ),
          const VerticalGap(size: 18),
          GestureDetector(
              onTap: () {
                _quizController.startTest(index: index);
              },
              child: const StartButton()),
        ],
      ),
    );
  }
}
