import 'dart:async';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/core/constants/app_constants.dart';
import 'package:moomalpublication/core/utils/toast.dart';import 'package:moomalpublication/features/quiz/data/constants/type_alias.dart';
import 'package:moomalpublication/features/quiz/data/models/answer_model.dart';
import 'package:moomalpublication/features/quiz/data/models/quiz_response_model.dart';
import 'package:moomalpublication/features/quiz/data/services/quiz_service.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';

class QuizController extends BaseController {
  final Rx<QuizResponse> quizResponse = Rx(QuizResponse());
  final Rx<TestResponse> testResponse = Rx(TestResponse());
  final List<QuizResponseModel> quizList = [];

  @override
  void onInit() {
    super.onInit();
    _getQuizList();
  }

  Future<void> _getQuizList() async {
    quizResponse.value = ApiResponse.loading();
    quizResponse.value = await QuizService.getQuizList();

    if (quizResponse.value.data != null) {
      quizList.clear();
      quizList.addAll(quizResponse.value.data!);
    } else {
      showToast(AppConstants.somethingWentWrong);
    }
  }

  void navigateQuizDetailScreen({required int index}) {
    AppRouting.toNamed(NameRoutes.quizTestDetailScreen, argument: [
      {"index": index}
    ]);
  }

  void navigateQuizTestScreen({required int index}) {
    AppRouting.toNamed(NameRoutes.quizTestScreen, argument: [
      {"index": index}
    ]);
  }

  // testScreen
  List<RxString> questionsList = <RxString>[].obs;
  RxList<List<Answer>> answerList = <List<Answer>>[].obs;
  RxBool testTaken = false.obs;
  int totalScore = 0;
  List<String> optionsName = ['a', 'b', 'c', 'd'];
  List<RxInt> selectedOptions = <RxInt>[].obs;
  RxInt counter = 0.obs;
  RxBool submitButton = true.obs;
  Timer? timer;

  void startTest({required int index}) async {
    testTaken.value = false;
    totalScore = 0;
    selectedOptions.clear();
    submitButton.value = true;
    counter.value = 0;
    questionsList.clear();
    answerList.clear();
    navigateQuizTestScreen(index: index);
    getTest().then((value) {
      startTimer(duration: 50);
    });
  }

  Future<void> getTest() async {
    testResponse.value = ApiResponse.loading();
    testResponse.value = await QuizService.getTestList();
    if (testResponse.value.data != null) {
      for (var qa in testResponse.value.data!.questionsAndAnswers!) {
        questionsList.add(RxString(qa.question.toString()));

        final RxList<Answer> answers = RxList<Answer>(
          qa.answers!
              .map<Answer>((answer) => Answer(
                    answer: answer.answer.toString(),
                    correctOrNot: answer.correctOrNot,
                  ))
              .toList(),
        );

        answerList.add(answers);
      }
      _initializeOptions();
    } else {
      showToast(AppConstants.somethingWentWrong);
    }
  }

  void startTimer({required int duration}) {
    counter.value = duration;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (counter.value > 0) {
        counter.value--;
      } else {
        timer.cancel();
        checkAnswers();
      }
    });
  }

  void selectedOption(
      {required int questionNumber, required int optionNumber}) {
    if (selectedOptions[questionNumber].value == optionNumber) {
      selectedOptions[questionNumber].value = -1;
      return;
    }
    selectedOptions[questionNumber].value = optionNumber;
  }

  void _initializeOptions() {
    selectedOptions = List<RxInt>.generate(
      questionsList.length,
      (index) => RxInt(-1),
    ).obs;
  }

  void checkAnswers() {
    submitButton.value = false;
    testTaken.value = true;
    for (int i = 0; i < answerList.length; i++) {
      for (int j = 0; j < answerList[i].length; j++) {
        if (answerList[i][j].correctOrNot == true &&
            selectedOptions[i].value == j) {
          totalScore++;
        }
      }
    }
  }

  void reTakeButton() {}

  void onBackPress() {
    if (timer != null && timer!.isActive) {
      timer!.cancel();
    }
    AppRouting.navigateBack();
  }
}

// RxList<RxList<Options>> optionsList = <RxList<Options>>[].obs;
// void _initializeOptions() {
//   selectedOptions = List<int>.generate(questionsList.length, (index) => -1);

//   for (int i = 0; i < questionsList.length; i++) {
//     RxList<Options> options = <Options>[].obs;
//     for (int j = 0; j < optionsName.length; j++) {
//       options.add(Options(name: optionsName[j]));
//     }
//     optionsList.add(options);
//   }
// }

// void selectedOption(
//     {required int questionNumber, required int optionNumber}) {
//   if (selectedOptions[questionNumber] == optionNumber) {
//     optionsList[questionNumber][optionNumber].unSelectedOption();
//     selectedOptions[questionNumber] = -1;
//     optionsList.refresh();
//     return;
//   } else if (selectedOptions[questionNumber] != -1) {
//     optionsList[questionNumber][selectedOptions[questionNumber]]
//         .unSelectedOption();
//     selectedOptions[questionNumber] = -1;
//   }
//   selectedOptions[questionNumber] = optionNumber;
//   optionsList[questionNumber][optionNumber].selectedOption();
//   optionsList.refresh();
// }
// class Options {
//   Options(
//       {required this.name,
//       this.color = AppColors.greyLight,
//       this.selected = false,
//       this.notSelected = true});
//   final String name;
//   Color color;
//   bool selected;
//   final bool notSelected;

//   void unSelectedOption() {
//     color = AppColors.greyLight;
//     selected = false;
//   }

//   void selectedOption() {
//     color = AppColors.orange;
//     selected = true;
//   }
// }
