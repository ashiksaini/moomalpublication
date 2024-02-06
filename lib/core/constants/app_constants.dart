import 'package:get/get.dart';

class AppConstants {
  AppConstants._();
  static String calibriFont = 'Calibri';
  static String gupterFont = 'Gupter';
  static String montaguSlabFont = 'MontaguSlab';
  static String minaFont = 'Mina';

  static String successfulResponse = "success";
  static String failedResponse = "failed";
  static const String emailRegExPattern =
      r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';

  static String badRequest = 'bad_request'.tr;
  static String forbidden = 'forbidden'.tr;
  static String pageNotFound = 'page_not_found'.tr;
  static String methodNotAllowed = 'method_not_allowed'.tr;
  static String requestTimeout = 'request_timeout'.tr;
  static String internalServerError = 'internal_server_error'.tr;
  static String badGateway = 'bad_gateway'.tr;
  static String serviceUnavailable = 'service_unavailable'.tr;
  static String gatewayTimeout = 'gateway_timeout'.tr;
  static String somethingWentWrong = 'something_went_wrong'.tr;

  static String fullLength = "Full Length";
  static String sectional = "Sectional";

  static int currentGKCategoryId = 19;
  static int rajasthanGKCategoryId = 33;
  static int reetExamCategoryId = 34;
  static int examReviewCategoryId = 43;
  static int newBookCategoryId = 20;
  static int modalPaperCategoryId = 32;

  static String dateTimeFormatter = "dd MMM, yyyy HH:mm a";
  static String dateFormatter = "d MMMM yyyy";
}
