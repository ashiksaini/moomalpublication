import 'package:flutter/material.dart';
import 'package:moomalpublication/features/event_press_release/presentation/widget/year_container.dart';

class YearList extends StatelessWidget {
  const YearList({super.key});

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
