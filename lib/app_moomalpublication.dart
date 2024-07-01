import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/get.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/routes/app_routes.dart';
import 'package:moomalpublication/routes/name_routes.dart';
import 'package:moomalpublication/routes/routing.dart';
import 'locale/app_translation.dart';

class MoomalPublication extends StatefulWidget {
  const MoomalPublication({super.key});

  @override
  State<MoomalPublication> createState() => _MoomalPublicationState();
}

class _MoomalPublicationState extends State<MoomalPublication> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
    _checkUpdate();
  }

  void _checkUpdate() {
    InAppUpdate.checkForUpdate().then((updateInfo) {
      if (updateInfo.updateAvailability == UpdateAvailability.updateAvailable) {
        if (updateInfo.immediateUpdateAllowed) {
          InAppUpdate.performImmediateUpdate().then((appUpdateResult) {
            if (appUpdateResult == AppUpdateResult.success) {
              AppRouting.offAllNamed(NameRoutes.splashScreen);
            }
          });
        }
      } else if (updateInfo.flexibleUpdateAllowed) {
        InAppUpdate.startFlexibleUpdate().then((appUpdateResult) {
          if (appUpdateResult == AppUpdateResult.success) {
            AppRouting.offAllNamed(NameRoutes.splashScreen);
            InAppUpdate.completeFlexibleUpdate();
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        navigatorKey: navigatorKey,
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
      ),
    );
  }
}
