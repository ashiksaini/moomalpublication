import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/utils/shared_data.dart';
import 'package:moomalpublication/routes/routing.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerScreen extends StatelessWidget {
  PdfViewerScreen({super.key});

  final SharedData? _sharedData = Get.arguments as SharedData?;

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
                title: _sharedData?.productName ?? "",
                prefixIcon: AppAssets.icBackArrow,
                onPrefixIconClick: () => AppRouting.navigateBack(),
                maxLine: 1,
              ),
              Expanded(
                child: SfPdfViewerTheme(
                  data: SfPdfViewerThemeData(
                    progressBarColor: AppColors.orange,
                    backgroundColor: AppColors.greyLight,
                  ),
                  child: SfPdfViewer.network(_sharedData?.productURL ?? ""),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
