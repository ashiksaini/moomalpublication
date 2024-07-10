import 'dart:async';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/core/constants/app_constants.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/utils/dialogs.dart';
import 'package:moomalpublication/core/utils/shared_data.dart';
import 'package:moomalpublication/core/utils/toast.dart';
import 'package:moomalpublication/features/new_test_series/presentation/screen/test_result_screen.dart';
import 'package:moomalpublication/features/quiz/data/constants/type_alias.dart';
import 'package:moomalpublication/features/quiz/data/models/question_answer_model.dart';
import 'package:moomalpublication/features/quiz/data/models/test_result_response_data.dart';
import 'package:moomalpublication/features/quiz/data/services/quiz_service.dart';
import 'package:moomalpublication/features/test_series/data/models/test_series_response_model.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';

class NewTestSeriesController extends BaseController {
  late SharedData? sharedData;
  late TestSeriesResponseModel? testSeriesResponseModel;
  final Rx<TestResponse> testResponse = Rx(TestResponse());
  final Rx<TestPostResponse> testSubmitResponse = Rx(TestPostResponse());
  final Rx<TestResultResponse> testResultResponse = Rx(TestResultResponse());
  final RxList<QuestionsAndAnswer> questions = RxList();
  final Rx<TestResultResponseData> testResultResponseData =
      Rx(TestResultResponseData());
  RxInt counter = 0.obs;
  RxBool submitButton = true.obs;
  Timer? timer;
  RxInt visibleQuestionIndex = RxInt(0);
  RxString title = RxString("");
  final RxList<ChartData> chartData = RxList();

  @override
  void onInit() {
    super.onInit();
    sharedData = Get.arguments as SharedData?;
    testSeriesResponseModel = sharedData?.testModel;

    getTest();
  }

  Future<void> getTest() async {
    questions.clear();
    testResponse.value = ApiResponse.loading();
    testResponse.value =
        await QuizService.getTestList(testSeriesResponseModel?.id.toString());

    if (testResponse.value.data != null) {
      questions.addAll(testResponse.value.data?.questionsAndAnswers ?? []);
      title.value = testResponse.value.data?.postTitle ?? "";
      testSeriesResponseModel?.questionCount =
          (testResponse.value.data?.questionsAndAnswers?.length ?? 0) - 1;
      startTimer(
          duration:
              (int.parse(testSeriesResponseModel?.maximumTime ?? "0") * 60));
    } else {
      showToast(AppConstants.somethingWentWrong);
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
        onTapSubmit();
      }
    });
  }

  void onTapSaveNext() {
    if (visibleQuestionIndex.value <
        (testSeriesResponseModel?.questionCount ?? 0)) {
      visibleQuestionIndex.value++;
    } else {
      showToast("test_completed_please_submit".tr);
    }
  }

  void onTapPrevious() {
    if (visibleQuestionIndex.value > -1) {
      visibleQuestionIndex.value--;
    }
  }

  void onTapSubmit() async {
    timer?.cancel();

    testSubmitResponse.value = ApiResponse.loading();
    testSubmitResponse.value = await QuizService.postTestData(
      testSeriesResponseModel?.id.toString(),
      ((int.parse(testSeriesResponseModel?.maximumTime ?? "0") * 60) -
              counter.value)
          .toString(),
      _getAnswers(),
    );

    if (testSubmitResponse.value.data != null) {
      showLottieDialog(Get.context!, AppAssets.successAnimation,
          "test_submitted_successfully".tr);
      Future.delayed(const Duration(milliseconds: 2002), () {
        AppRouting.offAndToNamed(NameRoutes.testResultScreen);
      });
    } else {
      showToast(AppConstants.somethingWentWrong);
    }
  }

  void onTapAnswer({required int optionNumber}) {
    if (visibleQuestionIndex.value != -1) {
      questions[visibleQuestionIndex.value].selectedOption = optionNumber;
    }
  }

  List<String> _getAnswers() {
    final List<String> answers = [];

    for (var question in questions) {
      answers.add((question.selectedOption == -1
          ? ""
          : question.selectedOption.toString()));
    }

    return answers;
  }

  void getResult() async {
    testResultResponse.value = ApiResponse.loading();
    testResultResponse.value = await QuizService.getTestResult(
      testSeriesResponseModel?.id.toString(),
    );

    if (testResultResponse.value.data != null) {
      testResultResponseData.value =
          testResultResponse.value.data ?? TestResultResponseData();

      parseResponse();
    } else {
      showToast(AppConstants.somethingWentWrong);
    }
  }

  String formatString(String input) {
    List<String> parts = input.split('/');
    double firstPart = double.parse(parts[0]);
    double secondPart = double.parse(parts[1]);

    String firstPartFormatted = formatDouble(firstPart);
    String secondPartFormatted = formatDouble(secondPart);
    return '$firstPartFormatted/$secondPartFormatted';
  }

  String formatDouble(double value) {
    if (value == 0.0) {
      return '0';
    }
    final formatter = NumberFormat('0.00');
    return formatter.format(value);
  }

  void parseResponse() {
    chartData.clear();

    chartData.addAll([
      ChartData(
          'total'.tr,
          (testResultResponseData.value.total ?? 0).toDouble(),
          AppColors.orange),
      ChartData(
          'correct'.tr,
          (testResultResponseData.value.correct ?? 0).toDouble(),
          AppColors.green),
      ChartData(
          'incorrect'.tr,
          (testResultResponseData.value.incorrect ?? 0).toDouble(),
          AppColors.red),
      ChartData(
          'skipped'.tr,
          (testResultResponseData.value.skipped ?? 0).toDouble(),
          AppColors.pinkLighter),
    ]);
  }
}
