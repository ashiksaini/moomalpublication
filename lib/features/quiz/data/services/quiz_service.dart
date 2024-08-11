import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart' as getx;
import 'package:moomalpublication/core/utils/toast.dart';
import 'package:moomalpublication/features/quiz/data/constants/type_alias.dart';
import 'package:moomalpublication/features/quiz/data/models/answer_model.dart';
import 'package:moomalpublication/features/quiz/data/models/question_answer_model.dart';
import 'package:moomalpublication/features/quiz/data/models/quiz_response_model.dart';
import 'package:moomalpublication/features/quiz/data/models/test_post_data.dart';
import 'package:moomalpublication/features/quiz/data/models/test_response_model.dart';
import 'package:moomalpublication/features/quiz/data/models/test_result_response_data.dart';
import 'package:moomalpublication/services/internet_connectivity/internet_connectivity.dart';
import 'package:moomalpublication/services/network/api_paths.dart';
import 'package:moomalpublication/services/network/dio_client.dart';
import 'package:moomalpublication/services/storage/shared_preferences_helper.dart';
import 'package:moomalpublication/services/storage/shared_preferences_keys.dart';

class QuizService {
  QuizService._();

  static Future<QuizResponse> getQuizList() async {
    if (getx.Get.find<InternetConnectivityController>()
        .haveInternetConnection
        .value) {
      try {
        final dio.Response<dynamic> response =
            await DioClient.dioWithoutAuth!.get(ApiPaths.quizData);

        final parsedResponse = (response.data as List<dynamic>?)!
            .map(
              (item) =>
                  QuizResponseModel.fromJson(item as Map<String, dynamic>),
            )
            .toList();
        return QuizResponse.success(parsedResponse);
      } on dio.DioException catch (error) {
        showToast(error.message.toString());
        return QuizResponse();
      }
    } else {
      showToast("no_internet_access".tr);
      return QuizResponse();
    }
  }

  static Future<TestResponse> getTestList(String? id) async {
    if (getx.Get.find<InternetConnectivityController>()
        .haveInternetConnection
        .value) {
      try {
        final dio.Response<dynamic> response = await DioClient.dioWithAuth!
            .get('${ApiPaths.quizTest}${id ?? "5233"}');

        final parsedResponse = TestQuestionsResponseModel.fromJson(
            response.data as Map<String, dynamic>);
        return TestResponse.success(parsedResponse);
      } on dio.DioException catch (error) {
        showToast(error.message.toString());
        return TestResponse();
      }
    } else {
      showToast("no_internet_access".tr);
      return TestResponse();
    }
  }

  static Future<TestResponse> getTestList1(String? id) async {
    if (getx.Get.find<InternetConnectivityController>()
        .haveInternetConnection
        .value) {
      try {
        final dio.Response<dynamic> response =
            await DioClient.dioWithAuth!.get(ApiPaths.quizTest1);

        late TestQuestionsResponseModel parsedResponse;
        late int index = -1;
        late List<QuestionsAndAnswer> questionsAndAnswers = [];
        for (int i = 0; i < (response.data as List<dynamic>).length; i++) {
          var item = response.data[i];
          if (id?.compareTo(item['quizID']) == 0) {
            index = i;

            List<Answer> answer = [];
            bool isCorrectAnswerFound = false;
            for (int j = 0;
                j < (item['answers'] as List<dynamic>).length;
                j++) {
              var answerItem = item['answers'][j];
              if (answerItem[2] == 1) {
                isCorrectAnswerFound = true;
              }

              if (answer.length < 3) {
                answer.add(Answer(
                    answer: answerItem[0], correctOrNot: answerItem[2] == 1));
              } else if (isCorrectAnswerFound) {
                answer.add(Answer(
                    answer: answerItem[0], correctOrNot: answerItem[2] == 1));
              }
            }

            questionsAndAnswers.add(QuestionsAndAnswer(
                question: item['question_title'], answers: answer));
          }
        }

        parsedResponse = TestQuestionsResponseModel(
          id: ((response.data as List<dynamic>)[index]
              as Map<String, dynamic>)['id'],
          postTitle: ((response.data as List<dynamic>)[index]
              as Map<String, dynamic>)['quiz_name'],
          postContent: "",
          questionsAndAnswers: questionsAndAnswers,
        );

        return TestResponse.success(parsedResponse);
      } on dio.DioException catch (error) {
        showToast(error.message.toString());
        return TestResponse();
      }
    } else {
      showToast("no_internet_access".tr);
      return TestResponse();
    }
  }

  static Future<TestPostResponse> postTestData(
      String? onlinePostId, String? timeLeft, List<String> anwers) async {
    if (getx.Get.find<InternetConnectivityController>()
        .haveInternetConnection
        .value) {
      try {
        final userId =
            await SharedPreferencesHelper.getInt(SharedPreferenceKeys.userId);

        final data = TestPostData(
          userId: userId.toString(),
          testId: onlinePostId,
          timeLeft: timeLeft,
          anwers: anwers,
        ).toJson();

        final dio.Response<dynamic> response = await DioClient.dioWithAuth!
            .post(ApiPaths.insertTestData, data: data);

        if (response.statusCode == 200) {
          return TestPostResponse.success(true);
        } else {
          return TestPostResponse.success(false);
        }
      } on dio.DioException catch (error) {
        showToast(error.message.toString());
        return TestPostResponse.success(false);
      }
    } else {
      showToast("no_internet_access".tr);
      return TestPostResponse.success(false);
    }
  }

  static Future<TestResultResponse> getTestResult(String? onlinePostId) async {
    if (getx.Get.find<InternetConnectivityController>()
        .haveInternetConnection
        .value) {
      try {
        final userId =
            await SharedPreferencesHelper.getInt(SharedPreferenceKeys.userId);

        final data = TestPostData(
          userId: userId.toString(),
          testId: onlinePostId,
        ).toJson();

        final dio.Response<dynamic> response =
            await DioClient.dioWithAuth!.post(ApiPaths.testResult, data: data);

        final parsedResponse = TestResultResponseData.fromJson(
            response.data as Map<String, dynamic>);

        if (response.statusCode == 200) {
          return TestResultResponse.success(parsedResponse);
        } else {
          return TestResultResponse();
        }
      } on dio.DioException catch (error) {
        showToast(error.message.toString());
        return TestResultResponse();
      }
    } else {
      showToast("no_internet_access".tr);
      return TestResultResponse();
    }
  }
}
