import 'package:flutter/material.dart';
import 'package:moomalpublication/features/detail_page/presentation/templates/detail_container.dart';

class DetailPageScreen extends StatelessWidget {
  const DetailPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: DetailContainer()),
    );
  }
}
