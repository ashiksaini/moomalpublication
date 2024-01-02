import 'package:flutter/material.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class TestGridSheet extends StatelessWidget {
  TestGridSheet({super.key});

  final List<String> leftData = [
    'Order ID',
    'Test Series',
    'Purchased On',
    'Action',
  ];
  final List<String> rightData = ['100', '200', '300', '400'];

  @override
  Widget build(BuildContext context) {
    List<TableRow> rows = [];

    for (int i = 0; i < leftData.length; i++) {
      rows.add(
        TableRow(
          decoration: const BoxDecoration(
            color: AppColors.orangeLight,
          ),
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: scaleHeight(14, context)),
              child: CustomText(
                text: leftData[i],
                textStyle: CustomTextStyle.textStyle25Bold(context,
                    color: AppColors.black),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: scaleHeight(14, context)),
              child: CustomText(
                text: rightData[i],
                textStyle: CustomTextStyle.textStyle25Bold(context,
                    color: AppColors.black),
              ),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: scaleHeight(20, context)),
      child: Table(
        border: TableBorder.all(),
        columnWidths: const <int, TableColumnWidth>{
          0: FlexColumnWidth(2),
          1: FlexColumnWidth(2.5),
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: rows,
      ),
    );
  }
}
