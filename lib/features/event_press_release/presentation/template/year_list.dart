import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/utils/no_glow_behaviour.dart';
import 'package:moomalpublication/features/event_press_release/controller/event_press_controller.dart';
import 'package:moomalpublication/features/event_press_release/presentation/widget/year_container.dart';

class YearList extends StatelessWidget {
  YearList({super.key});

  final EventPressController _eventPressController =
      Get.find<EventPressController>();
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoGlowBehavior(),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _eventPressController.yearListData.map((category) {
            return YearContainer(yearIndex: category.index ?? 0);
          }).toList(),
        ),
      ),
    );
  }
}
