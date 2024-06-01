import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/cart/presentation/widgets/shadow_container.dart';
import 'package:moomalpublication/features/latest_news/controller/latest_news_controller.dart';
import 'package:moomalpublication/features/latest_news/presentation/widget/newsDescription.dart';
import 'package:moomalpublication/routes/routing.dart';

class NewsDetailScreen extends StatelessWidget {
  NewsDetailScreen({super.key});

  final LatestNewsController _newsController = Get.find<LatestNewsController>();
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
                title: _newsController.latestNewsItem.title?.rendered ?? '',
                maxLine: 1,
                prefixIcon: AppAssets.icBackArrow,
                onPrefixIconClick: () => AppRouting.navigateBack(),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 30.v,
                      horizontal: 30.h,
                    ),
                    child: ShadowContainer(
                      containerChild: NewsDescription(),
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
