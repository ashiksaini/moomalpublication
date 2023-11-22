import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    );
  }
}
