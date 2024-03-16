import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_progress_indicator.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/features/thank_you_page/controller/thank_you_controller.dart';
import 'package:moomalpublication/features/thank_you_page/presentation/screen/order_success_screen.dart';
import 'package:moomalpublication/features/thank_you_page/presentation/template/thank_you_template.dart';

class ThankYouScreen extends StatelessWidget {
  ThankYouScreen({super.key});
  final OrderSuccessController orderSuccessController =
      Get.put(OrderSuccessController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor:
            orderSuccessController.orderSuccessResponse.value.isLoading
                ? AppColors.white
                : AppColors.green,
        body: SafeArea(
            child: orderSuccessController.orderSuccessResponse.value.isLoading
                ? Center(child: customProgressIndicator())
                : orderSuccessController.thankYouScreeShow.value
                    ? const ThankYouPageTemplate()
                    : OrderSuccessScreen()),
      ),
    );
  }
}
