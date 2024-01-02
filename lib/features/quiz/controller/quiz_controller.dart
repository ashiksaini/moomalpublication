import 'dart:async';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:moomalpublication/core/base/base_controller.dart';
import 'package:moomalpublication/core/constants/app_constants.dart';
import 'package:moomalpublication/core/utils/snackbar.dart';
import 'package:moomalpublication/features/quiz/data/constants/type_alias.dart';
import 'package:moomalpublication/features/quiz/data/models/quiz_response_model.dart';
import 'package:moomalpublication/features/quiz/data/services/quiz_service.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';
import 'package:moomalpublication/services/network/api_reponse.dart';

class QuizController extends BaseController {
  final Rx<QuizResponse> quizResponse = Rx(QuizResponse());
  final List<QuizResponseModel> quizList = [];

  @override
  void onInit() {
    super.onInit();
    _getQuizList();
    _initializeOptions();
    startTimer(duration: 20);

    ();
  }

  Future<void> _getQuizList() async {
    quizResponse.value = ApiResponse.loading();
    quizResponse.value = await QuizService.getQuizList();

    if (quizResponse.value.data != null) {
      quizList.clear();
      quizList.addAll(quizResponse.value.data!);
    } else {
      showSnackBar(AppConstants.somethingWentWrong);
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

  List<String> questionsList = [
    'हाल ही में प्रिंसेस ऑफ एस्टुरियस अवॉर्ड किस भारतीय को दिया गया है ?',
    '2 जून 2021 को राष्ट्रीय मानवाधिकार आयोग अध्यक्ष का पदभार निम्न में से किसने संभाला है?',
    'हाल ही हुए इक्यूई-अवॉर्ड शो इंडिया सोलर अवॉर्ड 2020-2021 दिया गया है?',
  ];

  List<String> optionsName = ['a', 'b', 'c', 'd'];
  List<RxInt> selectedOptions = <RxInt>[].obs;

  RxInt counter = 0.obs;
  RxBool submitButton = true.obs;

  void startTimer({required int duration}) {
    counter.value = duration;

    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (counter.value > 0) {
        counter.value--;
      } else {
        timer.cancel();
        submitButton.value = false;
      }
    });
  }

  void selectedOption(
      {required int questionNumber, required int optionNumber}) {
    if (selectedOptions[questionNumber] == optionNumber) {
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



