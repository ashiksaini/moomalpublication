import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/config/app_config.dart';
import 'package:moomalpublication/app_moomalpublication.dart';
import 'package:moomalpublication/services/internet_connectivity/internet_connectivity.dart';
import 'package:moomalpublication/services/logger/custom_logger.dart';
import 'package:moomalpublication/services/network/dio_client.dart';
import 'package:moomalpublication/services/storage/shared_preferences_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(InternetConnectivityController());

  AppConfig.init();

  SharedPreferencesHelper.init();

  DioClient.init();

  CustomLogger.init();

  runApp(
    const MoomalPublication(),
  );
}
