import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_progress_indicator.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';
import 'package:moomalpublication/features/event_press_release/controller/event_press_controller.dart';
import 'package:moomalpublication/routes/routing.dart';
import 'package:moomalpublication/services/network/api_paths.dart';

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

  double progress = 0;

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
              // SizedBox(height: 90.v),
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
                    height: 60.v,
                  ),
                  Tab(
                    text: '  Press\nRelease',
                    height: 60.v,
                  ),
                  Tab(
                    text: '  Media\nCoverage',
                    height: 60.v,
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
                            inappView(
                              url: ApiPaths.eventRelease,
                            ),
                            inappView(
                              url: ApiPaths.pressRelease,
                            ),
                            inappView(
                              url: ApiPaths.mediaCoverage,
                            ),
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

  Widget inappView({String? url}) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(top: 2.v),
            child: progress < 1.0
                ? LinearProgressIndicator(
                    value: progress,
                    color: AppColors.orange,
                  )
                : Container()),
        Expanded(
          child: InAppWebView(
            initialUrlRequest: URLRequest(
              url: WebUri(url ?? ""),
            ),
            onWebViewCreated: (InAppWebViewController controller) {
              // _webViewController = controller;
            },
            onLoadStart: (InAppWebViewController controller, WebUri? uri) {
              setState(() {
                url = uri.toString();
              });
            },
            onLoadStop: (InAppWebViewController controller, WebUri? uri) async {
              setState(() {
                url = uri.toString();
              });
            },
            onProgressChanged:
                (InAppWebViewController controller, int progress) {
              setState(() {
                this.progress = progress / 100;
              });
            },
          ),
        ),
      ],
    );
  }
}
