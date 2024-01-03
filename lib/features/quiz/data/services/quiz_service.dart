import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart' as getx;
import 'package:moomalpublication/core/utils/snackbar.dart';
import 'package:moomalpublication/features/quiz/data/constants/type_alias.dart';
import 'package:moomalpublication/features/quiz/data/models/quiz_response_model.dart';
import 'package:moomalpublication/services/internet_connectivity/internet_connectivity.dart';
import 'package:moomalpublication/services/network/api_paths.dart';
import 'package:moomalpublication/services/network/dio_client.dart';

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
        showSnackBar(error.message.toString());
        return QuizResponse();
      }
    } else {
      showSnackBar("no_internet_access".tr);
      return QuizResponse();
    }
  }
  static Future<QuizResponse> getTestList() async {
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
        showSnackBar(error.message.toString());
        return QuizResponse();
      }
    } else {
      showSnackBar("no_internet_access".tr);
      return QuizResponse();
    }
  }
}
