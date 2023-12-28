import 'package:flutter/material.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/test_series/data/models/test_series_response_model.dart';
import 'package:moomalpublication/features/test_series/presentation/template/list_card.dart';

class TabList extends StatelessWidget {
  final List<TestSeriesResponseModel> entries;
  const TabList({super.key, required this.entries});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.all(scaleWidth(8, context)),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(bottom: scaleHeight(20, context)),
            child: ListCard(
              barText: entries[index].postTitle ?? '',
            ),
          );
        });
  }
}
