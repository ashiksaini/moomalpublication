import 'package:flutter/material.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/cart/presentation/widgets/shadow_container.dart';
import 'package:moomalpublication/features/test_series/presentation/widgets/button_bar.dart';
import 'package:moomalpublication/features/test_series/presentation/widgets/marks_row.dart';

class ListCard extends StatelessWidget {
  const ListCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadowContainer(
      borderRadius: scaleRadius(10, context),
      containerChild: const Padding(
        padding: EdgeInsets.only(left: 8, right: 8),
        child: Column(
          children: [
            // CustomButtonBar(buttonText: 'Start Test', barText: 'GK Test Quiz(Free)',buttonVisibility: false),
            CustomButtonBar(
                buttonText: 'Start Test', barText: 'GK Test Quiz(Free)'),
            MarksRow(),
          ],
        ),
      ),
    );
  }
}
