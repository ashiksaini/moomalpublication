import 'dart:async';

import 'package:get/get.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/core/utils/shared_data.dart';
import 'package:moomalpublication/core/utils/toast.dart';
import 'package:moomalpublication/features/new_test_series/data/model/quiz_question_list.dart';

class NewTestSeriesController extends BaseController {
  late SharedData sharedData;

  RxInt noOfQuestion = RxInt(0);
  RxList<QuizQuestions> answerList = RxList();
  RxBool saveNext = RxBool(false);
  RxBool previous = RxBool(false);
  RxInt counter = 0.obs;
  Timer? timer;

  @override
  void onInit() {
    super.onInit();
    sharedData = Get.arguments as SharedData;

    getQuestionsList();

    startTimer(duration: 60);
  }

  void getQuestionsList() {
    answerList.add(QuizQuestions(
      options: ["A", "B", "C", "D"],
      question:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
    ));
    answerList.add(QuizQuestions(
      options: [
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident,",
        "B",
        "CA",
        "D"
      ],
      question:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
    ));
    answerList.add(QuizQuestions(
      options: ["AA", "BA", "CE", "D"],
      question: "jdfhgjdhjk",
    ));
    answerList.add(QuizQuestions(
      options: ["A!", "BJ", "CS", "D"],
      question:
          "fjhdgxvcbx gdausfjbvhsgdfuihsk vbsdgfhskcnmzbvsdjh vbgfhalsknm",
    ));
  }

  void onTapAnswer({required int optionNumber}) {
    if (answerList[noOfQuestion.value].selectedOption == optionNumber) {
      answerList[noOfQuestion.value].selectedOption = null;
    } else {
      answerList[noOfQuestion.value].selectedOption = optionNumber;
    }
    answerList.refresh();
  }

  void onTapPrevious() {
    if (noOfQuestion > 0) {
      noOfQuestion--;
      previousHandle();
    } else {
      previous.value = false;
    }
  }

  void onTapSaveNext() {
    if (noOfQuestion < answerList.length - 1) {
      noOfQuestion++;
      previous.value = true;
    } else {
      saveNext.value = false;
    }
  }

  void previousHandle() {
    if (noOfQuestion.value == 0) {
      previous.value = false;
    } else {
      previous.value = true;
    }
  }

  List<int?> answers = [];
  void onSubmit() {
    for (int i = 0; i < answerList.length; i++) {}
    for (var x in answerList) {
      answers.add(x.selectedOption);
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
        // call on Submit
      }
    });
  }
}
