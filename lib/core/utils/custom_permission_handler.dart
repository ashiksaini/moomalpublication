import 'package:permission_handler/permission_handler.dart';

enum RequiredPermission {
  notification,
  packageInstall,
  storage,
  manageExternalStorage
}

class CustomPermissionHandler {
  CustomPermissionHandler._();

  static void requestPermissions(
      List<RequiredPermission> requiredpermissions) async {
    for (RequiredPermission permission in requiredpermissions) {
      switch (permission) {
        case RequiredPermission.notification:
          {
            bool isGranted = await Permission.notification.isGranted;
            if (!isGranted) {
              await Permission.notification.request();
            }
          }
          break;

        case RequiredPermission.packageInstall:
          {
            bool isGranted = await Permission.requestInstallPackages.isGranted;
            if (!isGranted) {
              await Permission.requestInstallPackages.request();
            }
          }
          break;

        case RequiredPermission.storage:
          {
            bool isGranted = await Permission.storage.isGranted;
            if (!isGranted) {
              await Permission.storage.request();
            }
          }
          break;

        case RequiredPermission.manageExternalStorage:
          {
            bool isGranted = await Permission.manageExternalStorage.isGranted;
            if (!isGranted) {
              await Permission.manageExternalStorage.request();
            }
          }
          break;
      }
    }
  }
}
