import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/features/all%20categories/presentation/screens/all_categories.dart';
import 'package:moomalpublication/features/auth/presentation/screens/login_screen.dart';
import 'package:moomalpublication/features/home/presentation/screens/home_screen.dart';
import 'locale/app_translation.dart';

class MoomalPublication extends StatelessWidget {
  const MoomalPublication({super.key});
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      translationsKeys: AppTranslation.translationKeys,
      title: "sam_construction".tr,
      home: AllCategories(),
    );
  }
}
