import 'package:flutter/material.dart';
import 'package:moomalpublication/core/theme/dimen.dart';

class TabItem extends StatelessWidget {
  const TabItem({super.key, required this.text, required this.length});
  final String text;
  final int length;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: scaleHeight(2, context)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$text ($length)',
            textAlign: TextAlign.center,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
