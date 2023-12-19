import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/event_press_release/controller/event_press_controller.dart';
import 'package:moomalpublication/features/event_press_release/presentation/widget/year_container.dart';

class YearList extends StatelessWidget {
  YearList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        YearContainer(yearIndex: 0),
        YearContainer(yearIndex: 1),
        YearContainer(yearIndex: 2),
        YearContainer(yearIndex: 3),
      ],
    );
  }
}
