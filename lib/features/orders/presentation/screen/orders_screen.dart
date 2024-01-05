import 'package:flutter/material.dart';
import 'package:moomalpublication/core/components/organisms/empty_cart_view.dart';
import 'package:moomalpublication/core/theme/colors.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EmptyCartView(title: "title"),
          ],
        ),
      ),
    );
  }
}
