import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/utils/custom_permission_handler.dart';
import 'package:moomalpublication/core/utils/toast.dart';
import 'package:open_file/open_file.dart';

class Donwloader {
  Donwloader._();

  static Future<void> downloadFile(String name, String url) async {
    CustomPermissionHandler.requestPermissions([
      RequiredPermission.notification,
      RequiredPermission.manageExternalStorage,
      RequiredPermission.storage,
      RequiredPermission.packageInstall
    ]);

    FileDownloader.downloadFile(
      notificationType: NotificationType.all,
      url: url,
      name: name,
      onProgress: (fileName, progress) {
        if (progress > 1) {
          showToast("downloading".tr);
        }
      },
      onDownloadCompleted: (String path) {
        showToast("downloading_complete".tr);
        OpenFile.open(path);
      },
      onDownloadError: (String error) {
        showToast(
            "some_error_occured_while_downloading_please_try_again".tr);
      },
    );
  }
}
