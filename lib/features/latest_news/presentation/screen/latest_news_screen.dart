import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_progress_indicator.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/components/organisms/empty_product.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/latest_news/controller/latest_news_controller.dart';
import 'package:moomalpublication/features/latest_news/presentation/widget/card_latest_news_item.dart';
import 'package:moomalpublication/routes/routing.dart';

class LatestNewsScreen extends StatelessWidget {
  LatestNewsScreen({super.key});

  final LatestNewsController _latestNewsController = Get.put(LatestNewsController());
  
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
                prefixIcon: AppAssets.icBackArrow,
                onPrefixIconClick: () => AppRouting.navigateBack(),
                title: 'latest_news1'.tr,
                maxLine: 1,
              ),
              Obx(
                () => Expanded(
                  child: _latestNewsController.latestNewsResponse.value.isLoading
                      ? Center(child: customProgressIndicator())
                      : _latestNewsController.latestNews.isNotEmpty
                          ? ListView.builder(
                            itemCount: _latestNewsController.latestNews.length,
                            itemBuilder: (_, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 12.v),
                                child: CardLatestNewsItem(latestNewsItem: _latestNewsController.latestNews[index],),
                              );
                            }
                          )
                          : Center(
                              child:
                                  EmptyProductView(title: "no_latest_news_available".tr)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}