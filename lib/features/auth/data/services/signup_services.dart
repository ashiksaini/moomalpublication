// import 'package:sam_construction/core/base/base_response.dart';
// import 'package:sam_construction/core/utils/snackbar.dart';
// import 'package:sam_construction/features/auth/data/constants/type_alias.dart';
// import 'package:sam_construction/features/auth/data/models/login_response_data/login_response_data.dart';
// import 'package:sam_construction/services/internet_connectivity/internet_connectivity.dart';
// import 'package:dio/dio.dart' as dio;
// import 'package:get/get.dart' as getx;
// import 'package:sam_construction/services/network/api_paths.dart';
// import 'package:sam_construction/services/network/dio_client.dart';

// class SignupServices {
//   SignupServices._();

//   static Future<LoginResponse> register({Map<String, dynamic>? data}) async {
//     if (getx.Get.find<InternetConnectivityController>().haveInternetConnection.value) {
//       try {
//         final dio.Dio dioo = DioClient.createDio();
//         final dio.Response<dynamic> response = await dioo.post(ApiPaths.signup, data: data);

//         final parsedResponse = BaseReponse<LoginResponseData>.fromJson(
//           response.data! as Map<String, dynamic>,
//           (data) => LoginResponseData.fromJson(data as Map<String, dynamic>),
//         );

//         return LoginResponse.success(parsedResponse);
//       } on dio.DioException catch (error) {
//         final parsedResponse = BaseReponse<LoginResponseData>.fromJson(
//           error.response!.data as Map<String, dynamic>,
//           (data) => LoginResponseData.fromJson(data as Map<String, dynamic>),
//         );

//         return LoginResponse.success(parsedResponse);
//       }
//     } else {
//       showSnackBar("no_internet_access".tr);
//       return LoginResponse();
//     }
//   }
// }
