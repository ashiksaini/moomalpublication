import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class BookDetailTabBar extends StatefulWidget {
  final String? description;
  final String? information;
  const BookDetailTabBar({super.key, this.description, this.information});

  @override
  _BookDetailTabBarState createState() => _BookDetailTabBarState();
}

class _BookDetailTabBarState extends State<BookDetailTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController colorController = TextEditingController();

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TabBar(
          unselectedLabelColor: AppColors.grey,
          labelColor: AppColors.green,
          dividerColor: AppColors.grey,
          labelStyle: CustomTextStyle.textStyle25Bold(context),
          unselectedLabelStyle: CustomTextStyle.textStyle25Bold(context),
          indicatorColor: AppColors.green,
          tabs: [
            Tab(text: "description".tr),
            Tab(text: "information".tr),
          ],
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: screenHeight(context) * 0.1),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: scaleWidth(15, context)),
            child: TabBarView(
              controller: _tabController,
              children: [
                CustomText(
                  text: widget.description ?? "no_description_found".tr,
                  textStyle: CustomTextStyle.textStyle20Bold(context,
                      color: AppColors.black.withOpacity(0.75)),
                  textAlign: TextAlign.start,
                ),
                CustomText(
                  text: widget.information ?? "no_information_found",
                  textStyle: CustomTextStyle.textStyle20Bold(context,
                      color: AppColors.black.withOpacity(0.75)),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
