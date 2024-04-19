import 'package:flutter/material.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';

class MyOrder extends StatelessWidget {
  const MyOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppbar(title: 'My order'),
            VerticalGap(size: 100),
            // MyOrderCard(),
          ],
        ),
      ),
    );
  }
}
