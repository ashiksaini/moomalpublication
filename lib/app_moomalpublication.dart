import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/routes/app_routes.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'locale/app_translation.dart';

class MoomalPublication extends StatefulWidget {
  const MoomalPublication({super.key});

  @override
  State<MoomalPublication> createState() => _MoomalPublicationState();
}

class _MoomalPublicationState extends State<MoomalPublication> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      translationsKeys: AppTranslation.translationKeys,
      title: "moomalpublication".tr,
      getPages: AppPages.pages,
      initialRoute: NameRoutes.splashScreen,
      theme: ThemeData(
        useMaterial3: true,
      ),
      // builder: (context, child) {
      //   return MediaQuery(
      //     data:
      //         MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
      //     child: child!,
      //   );
      // },
    );
  }
}
