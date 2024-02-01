import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/cart/presentation/widgets/shadow_container.dart';
import 'package:moomalpublication/features/quiz/controller/quiz_controller.dart';

class TestSubmitButton extends StatelessWidget {
  TestSubmitButton({super.key});
  final QuizController _quizController = Get.find<QuizController>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          _quizController.submitButton.value
              ? _quizController.checkAnswers()
              : _quizController.reTakeButton();
        },
        child: ShadowContainer(
          margin: EdgeInsets.only(
              top: scaleHeight(30, context), bottom: scaleHeight(20, context)),
          padding: EdgeInsets.symmetric(
              vertical: scaleHeight(12, context),
              horizontal: scaleWidth(25, context)),
          backgroundColor: AppColors.orange,
          borderColor: AppColors.white,
          borderRadius: scaleRadius(6, context),
          containerChild: Obx(
            () => CustomText(
              text: _quizController.submitButton.isTrue
                  ? 'SUBMIT'.tr
                  : 'RETAKE'.tr,
              textStyle: CustomTextStyle.textStyle25Bold(context,
                  color: AppColors.white),
            ),
          ),
        ),
      ),
    );
  }
}
