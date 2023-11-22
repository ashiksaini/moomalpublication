import 'package:flutter/material.dart';
import 'package:moomalpublication/core/components/organisms/card_book_item.dart';
import 'package:moomalpublication/core/theme/box_decorations.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: gradientBg(),
        ),
        child: Center(
          child: CardBookItem(),
        ),
      ),
    );
  }
}
