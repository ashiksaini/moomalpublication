import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/features/all%20categories/presentation/screens/all_categories.dart';
import 'package:moomalpublication/features/home/presentation/screens/home_screen.dart';
import 'package:moomalpublication/routes/app_routes.dart';
import 'package:moomalpublication/routes/name_routes.dart';
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
      getPages: AppPages.pages,
      initialRoute: NameRoutes.splashScreen,
      home: HomeScreen(),
    );
  }
}
