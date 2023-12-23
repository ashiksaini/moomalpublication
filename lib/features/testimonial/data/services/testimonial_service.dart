import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart' as getx;
import 'package:moomalpublication/core/base/base_response.dart';
import 'package:moomalpublication/core/utils/snackbar.dart';
import 'package:moomalpublication/features/testimonial/data/constants/type_alias.dart';
import 'package:moomalpublication/features/testimonial/data/models/testimonial_response_model.dart';
import 'package:moomalpublication/services/internet_connectivity/internet_connectivity.dart';
import 'package:moomalpublication/services/network/api_paths.dart';
import 'package:moomalpublication/services/network/dio_client.dart';

class TestimonialService {
  TestimonialService._();

  static Future<TestimonialResponse> getTestimonials() async {
    if (getx.Get.find<InternetConnectivityController>().haveInternetConnection.value) {
      try {
        final dio.Response<dynamic> response = await DioClient.dioWithoutAuth!.get(ApiPaths.testimonial);

        final parsedResponse = BaseResponse<List<TestimonialResponseModel>>.fromJson(
          response.data! as Map<String, dynamic>,
          (data) => (data as List<dynamic>?)!
              .map(
                (item) => TestimonialResponseModel.fromJson(item as Map<String, dynamic>),
              )
              .toList(),
        );

        return TestimonialResponse.success(parsedResponse);
      } on dio.DioException catch (error) {
        showSnackBar(error.message.toString());
        return TestimonialResponse();
      }
    } else {
      showSnackBar("no_internet_access".tr);
      return TestimonialResponse();
    }
  }
}
