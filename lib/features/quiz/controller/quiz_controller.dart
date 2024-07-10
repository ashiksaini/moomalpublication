import 'dart:async';
import 'package:get/get.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/core/constants/app_constants.dart';
import 'package:moomalpublication/core/utils/toast.dart';
import 'package:moomalpublication/features/quiz/data/constants/type_alias.dart';
import 'package:moomalpublication/features/quiz/data/models/answer_model.dart';
import 'package:moomalpublication/features/quiz/data/models/quiz_response_model.dart';
import 'package:moomalpublication/features/quiz/data/services/quiz_service.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';

class QuizController extends BaseController {
  final Rx<QuizResponse> quizResponse = Rx(QuizResponse());
  final Rx<TestResponse> testResponse = Rx(TestResponse());
  final List<QuizResponseModel> currentAffairsquizList = [];
  final List<QuizResponseModel> economicQuizList = [];
  late QuizType selectedQuizType;

  @override
  void onInit() {
    super.onInit();
    _getQuizList();
  }

  Future<void> _getQuizList() async {
    quizResponse.value = ApiResponse.loading();
    quizResponse.value = await QuizService.getQuizList();

    if (quizResponse.value.data != null) {
      currentAffairsquizList.clear();
      economicQuizList.clear();
      currentAffairsquizList.addAll(quizResponse.value.data!.where((element) =>
          element.quizName?.toLowerCase().contains("affairs") == true));
      economicQuizList.addAll(quizResponse.value.data!.where((element) =>
          element.quizName?.toLowerCase().contains("economics") == true));
    } else {
      showToast(AppConstants.somethingWentWrong);
    }
  }

  void navigateQuizDetailScreen(
      {required int index, required QuizType quizType}) {
    selectedQuizType = quizType;
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
  int selectedIndex = -1;

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
      startTimer(duration: 300);
    });
  }

  Future<void> getTest() async {
    testResponse.value = ApiResponse.loading();
    testResponse.value = await QuizService.getTestList1(
        (selectedQuizType == QuizType.currentAffairQuiz
            ? currentAffairsquizList[selectedIndex].id
            : economicQuizList[selectedIndex].id));
    if (testResponse.value.data != null) {
      if (testResponse.value.data!.questionsAndAnswers != null &&
          testResponse.value.data!.questionsAndAnswers?.isNotEmpty == true) {
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
        showErrorToast("no_question_answer_available".tr);
        timer?.cancel();
        AppRouting.navigateBack();
      }
    } else {
      showErrorToast(AppConstants.somethingWentWrong);
      timer?.cancel();
      AppRouting.navigateBack();
    }
  }

  void startTimer({required int duration}) {
    counter.value = duration;
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (counter.value > 0) {
        counter.value--;
      } else {
        timer.cancel();
        showErrorToast('times_up'.tr);
        checkAnswers(true);
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

  void checkAnswers(bool isTimeUp) {
    if (!isTimeUp && _isAnySelected()) {
      showErrorToast('please_mark_atleast_one_question'.tr);
    } else {
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
  }

  void reTakeButton() {
    testTaken.value = false;
    totalScore = 0;
    selectedOptions.clear();
    submitButton.value = true;
    questionsList.clear();
    answerList.clear();
    timer = null;
    getTest().then((value) {
      startTimer(duration: 60);
    });
  }

  void onBackPress() {
    timer?.cancel();
    AppRouting.navigateBack();
  }

  bool _isAnySelected() {
    for (var element in selectedOptions) {
      if (element != RxInt(-1)) {
        return false;
      }
    }

    return true;
  }
}
