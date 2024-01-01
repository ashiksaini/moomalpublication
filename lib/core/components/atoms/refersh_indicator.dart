import 'package:flutter/material.dart';
import 'package:moomalpublication/core/theme/colors.dart';

class CustomRefreshIndicator extends StatelessWidget {
  final Function onRefreshCallback;
  final Widget child;

  const CustomRefreshIndicator({
    super.key,
    required this.child,
    required this.onRefreshCallback,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await onRefreshCallback();
      },
      backgroundColor: AppColors.white,
      color: AppColors.orange,
      child: child,
    );
  }
}
