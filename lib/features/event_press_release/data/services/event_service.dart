import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart' as getx;
import 'package:moomalpublication/core/utils/toast.dart';
import 'package:moomalpublication/features/event_press_release/data/constants/type_alias.dart';
import 'package:moomalpublication/features/event_press_release/data/models/event_response_model.dart';
import 'package:moomalpublication/features/event_press_release/data/models/press_event_response_model.dart';
import 'package:moomalpublication/services/internet_connectivity/internet_connectivity.dart';
import 'package:moomalpublication/services/network/api_paths.dart';
import 'package:moomalpublication/services/network/dio_client.dart';

class EventService {
  EventService._();

  static Future<EventsResponse> getEvents({Map<String, dynamic>? query}) async {
    if (getx.Get.find<InternetConnectivityController>()
        .haveInternetConnection
        .value) {
      try {
        final dio.Response<dynamic> response = await DioClient.dioWithoutAuth!
            .get(ApiPaths.eventRelease, queryParameters: query);

        final parsedResponse = (response.data as List<dynamic>?)!
            .map(
              (item) =>
                  EventsResponseModel.fromJson(item as Map<String, dynamic>),
            )
            .toList();
        return EventsResponse.success(parsedResponse);
      } on dio.DioException catch (error) {
        showToast(error.message.toString());
        return EventsResponse();
      }
    } else {
      showToast("no_internet_access".tr);
      return EventsResponse();
    }
  }

  static Future<PressReleaseResponse> getPressRelease(
      {Map<String, dynamic>? query}) async {
    print(query);
    if (getx.Get.find<InternetConnectivityController>()
        .haveInternetConnection
        .value) {
      try {
        final dio.Response<dynamic> response = await DioClient.dioWithoutAuth!
            .get(ApiPaths.pressRelease, queryParameters: query);

        final parsedResponse = (response.data as List<dynamic>?)!
            .map(
              (item) => PressEventResponseModel.fromJson(
                  item as Map<String, dynamic>),
            )
            .toList();
        return PressReleaseResponse.success(parsedResponse);
      } on dio.DioException catch (error) {
        showToast(error.message.toString());
        return PressReleaseResponse();
      }
    } else {
      showToast("no_internet_access".tr);
      return PressReleaseResponse();
    }
  }
}
