import 'package:flutter/material.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';
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
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                CustomAppbar(
                  title: "Event And Press Release",
                  prefixIcon: AppAssets.icBackArrow,
                  onPrefixIconClick: () => AppRouting.navigateBack(),
                  maxLine: 1,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        HorizontalGap(size: 20),
                        Container(height: 200, child: YearList()),
                        HorizontalGap(size: 20),
                        TabBar(
                          unselectedLabelColor: AppColors.grey,
                          labelColor: AppColors.orange,
                          dividerColor: AppColors.grey,
                          labelStyle: CustomTextStyle.textStyle20Bold(context),
                          unselectedLabelStyle:
                              CustomTextStyle.textStyle20Bold(context),
                          indicatorColor: AppColors.orange,
                          tabs: const [
                            Tab(
                              text: 'Events',
                            ),
                            Tab(
                              text: 'Press Release',
                            ),
                            Tab(
                              text: 'Media Coverage',
                            ),
                          ],
                          controller: _tabController,
                          indicatorSize: TabBarIndicatorSize.tab,
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              ListView.builder(
                                itemCount: 3,
                                itemBuilder: (BuildContext context, int index) {
                                  return EventAndPressCard(index: index);
                                },
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: scaleHeight(10, context)),
                                child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: 3,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return const PressEvent();
                                  },
                                ),
                              ),
                              const MediaCoverage(),
                            ],
                          ),
                        ),
                      ],
                      
                    ),
                  ),

                ),
             
              ],
            ),
          ],
        ),
      ),
    );
  }
}
