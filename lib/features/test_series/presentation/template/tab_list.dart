import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/refersh_indicator.dart';
import 'package:moomalpublication/core/components/organisms/empty_product.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/test_series/data/models/test_series_response_model.dart';
import 'package:moomalpublication/features/test_series/presentation/template/list_card.dart';

class TabList extends StatelessWidget {
  final List<TestSeriesResponseModel> entries;
  final Function onRefresh;
  const TabList({super.key, required this.entries, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return (entries.isEmpty)
        ? Center(
            child: EmptyProductView(
              title: 'no_test_available'.tr,
            ),
          )
        : CustomRefreshIndicator(
            onRefreshCallback: () => onRefresh(),
            child: ListView.builder(
              padding: EdgeInsets.symmetric(
                  vertical: scaleWidth(26, context),
                  horizontal: scaleWidth(15, context)),
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: scaleHeight(20, context)),
                  child: ListCard(
                    entry: entries[index],
                  ),
                );
              },
            ),
          );
  }
}
