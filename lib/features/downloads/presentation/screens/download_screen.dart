import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_progress_indicator.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/components/organisms/empty_cart_view.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/features/downloads/controller/download_controller.dart';
import 'package:moomalpublication/features/downloads/presentation/template/download_card.dart';
import 'package:moomalpublication/routes/routing.dart';

class DownloadScreen extends StatelessWidget {
  DownloadScreen({super.key});
  final DownloadController downloadController = Get.put(DownloadController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Container(
          color: AppColors.white,
          child: Column(
            children: [
              CustomAppbar(
                title: "my_downloads".tr,
                maxLine: 1,
                prefixIcon: AppAssets.icBackArrow,
                onPrefixIconClick: () => AppRouting.navigateBack(),
              ),
              Obx(
                () => Expanded(
                  child:
                      downloadController.downloadSeriesResponse.value.isLoading
                          ? Center(child: customProgressIndicator())
                          : downloadController.downloadList.isEmpty
                              ? Center(child: EmptyCartView(title: "no_item_downloaded".tr))
                              : SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      DownloadCard(
                                        downloadList:
                                            downloadController.downloadList,
                                      )
                                    ],
                                  ),
                                ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
