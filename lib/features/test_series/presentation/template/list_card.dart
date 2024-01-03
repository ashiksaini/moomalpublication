import 'package:flutter/material.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/utility.dart';
import 'package:moomalpublication/features/cart/presentation/widgets/shadow_container.dart';
import 'package:moomalpublication/features/test_series/data/models/test_series_response_model.dart';
import 'package:moomalpublication/features/test_series/presentation/widgets/button_bar.dart';
import 'package:moomalpublication/features/test_series/presentation/widgets/marks_row.dart';

class ListCard extends StatelessWidget {
  const ListCard({super.key, required this.entry});

  final TestSeriesResponseModel entry;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Utility.launchurl(entry.permalink.toString());
        print(entry.permalink.toString());
      },
      child: ShadowContainer(
        borderRadius: scaleRadius(10, context),
        containerChild: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Column(
            children: [
              // CustomButtonBar(buttonText: 'Start Test', barText: 'GK Test Quiz(Free)',buttonVisibility: false),
              CustomButtonBar(
                buttonText:
                    (entry.freePaid == 'paid') ? 'Buy Now' : 'Start Test',
                barText: entry.postTitle ?? '',
              ),
              MarksRow(
                entry: entry,
                showPrice: (entry.freePaid == 'paid') ? true : false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
