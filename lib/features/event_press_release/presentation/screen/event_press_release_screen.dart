import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_progress_indicator.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/components/organisms/empty_product.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';
import 'package:moomalpublication/features/event_press_release/controller/event_press_controller.dart';
import 'package:moomalpublication/features/event_press_release/presentation/screen/media_coverage.dart';
import 'package:moomalpublication/features/event_press_release/presentation/screen/press_event.dart';
import 'package:moomalpublication/features/event_press_release/presentation/template/event_press_template.dart';
import 'package:moomalpublication/features/event_press_release/presentation/template/year_list.dart';
import 'package:moomalpublication/routes/routing.dart';

class EventAndPressReleaseScreen extends StatefulWidget {
  const EventAndPressReleaseScreen({super.key});

  @override
  State<EventAndPressReleaseScreen> createState() =>
      _EventAndPressReleaseScreenState();
}

class _EventAndPressReleaseScreenState extends State<EventAndPressReleaseScreen>
    with SingleTickerProviderStateMixin {
  final EventPressController _eventPressController =
      Get.put(EventPressController());
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

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
                title: "event_and_press_release".tr,
                prefixIcon: AppAssets.icBackArrow,
                onPrefixIconClick: () => AppRouting.navigateBack(),
                maxLine: 1,
              ),
              const HorizontalGap(size: 20),
              SizedBox(height: scaleHeight(90, context), child: YearList()),
              TabBar(
                unselectedLabelColor: AppColors.grey,
                labelColor: AppColors.orange,
                dividerColor: AppColors.grey,
                labelStyle: CustomTextStyle.textStyle20Bold(context),
                unselectedLabelStyle: CustomTextStyle.textStyle20Bold(context),
                indicatorColor: AppColors.orange,
                tabs: [
                  Tab(
                    text: 'events'.tr,
                    height: scaleHeight(60, context),
                  ),
                  Tab(
                    text: '  Press\nRelease',
                    height: scaleHeight(60, context),
                  ),
                  Tab(
                    text: '  Media\nCoverage',
                    height: scaleHeight(60, context),
                  ),
                ],
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
              ),
              const HorizontalGap(size: 20),
              Obx(
                () => Expanded(
                  child: (_eventPressController.eventResponse.value.isLoading)
                      ? Center(child: customProgressIndicator())
                      : TabBarView(
                          controller: _tabController,
                          children: [
                            _eventPressController.events.isNotEmpty
                                ? ListView.builder(
                                    itemCount:
                                        _eventPressController.events.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return EventAndPressCard(index: index);
                                    },
                                  )
                                : Center(
                                    child: EmptyProductView(
                                      title: 'not_available'.tr,
                                    ),
                                  ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: scaleHeight(10, context)),
                              child: _eventPressController
                                      .pressReleaseList.isNotEmpty
                                  ? ListView.builder(
                                      physics: const BouncingScrollPhysics(),
                                      itemCount: _eventPressController
                                          .pressReleaseList.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return PressEvent(index: index);
                                      },
                                    )
                                  : Center(
                                      child: EmptyProductView(
                                        title: 'not_available'.tr,
                                      ),
                                    ),
                            ),
                            const MediaCoverage(),
                          ],
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
