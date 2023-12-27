import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/all%20categories/controller/category_wise_controller.dart';

class CategoryWiseScreen extends StatelessWidget {
  CategoryWiseScreen({super.key});

  final CategoryWiseController _categoryWiseController = Get.put(CategoryWiseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          _getUpperView(context),
        ],
      ),
    );
  }

  Widget _getUpperView(BuildContext context) {
    return Stack(
      children: [
        CustomAppbar(title: "title"),
        Container(
          height: scaleHeight(200, context),
          decoration: BoxDecoration(
            color: AppColors.grey,
            
          ),
        )
      ],
    );
  }
}
