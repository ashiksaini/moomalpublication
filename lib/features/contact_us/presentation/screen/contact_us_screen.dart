import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/contact_us/controller/contact_us_controller.dart';
import 'package:moomalpublication/features/contact_us/presentation/template/contact_card.dart';
import 'package:moomalpublication/features/contact_us/presentation/widgets/bottom_marker.dart';
import 'package:moomalpublication/routes/routing.dart';

class ContactUsScreen extends StatelessWidget {
  ContactUsScreen({super.key});

  final ContactUsController contactUsController =
      Get.put(ContactUsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
          child: Container(
        color: AppColors.white,
        child: Column(
          children: [
            CustomAppbar(
              title: "contact_us".tr,
              prefixIcon: AppAssets.icBackArrow,
              onPrefixIconClick: () => AppRouting.navigateBack(),
              maxLine: 1,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.v, horizontal: 16.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: contactUsController.address.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.v),
                              child: ContactCard(
                                contactImage: contactUsController
                                        .address[index].iconName ??
                                    AppAssets.icAddress,
                                contactText: contactUsController
                                        .address[index].addressHeader ??
                                    '',
                                contactDescription: contactUsController
                                        .address[index].addressDescription ??
                                    '',
                              ),
                            );
                          }),
                    ],
                  ),
                ),
              ),
            ),
            const BottomMarker(),
          ],
        ),
      )),
    );
  }
}
