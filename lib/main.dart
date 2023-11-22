import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/app_moomalpublication.dart';
import 'package:moomalpublication/services/internet_connectivity/internet_connectivity.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(InternetConnectivityController());

  runApp(const MoomalPublication());
}
