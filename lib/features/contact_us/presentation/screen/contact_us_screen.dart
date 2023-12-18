import 'package:flutter/material.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/contact_us/presentation/template/contact_card.dart';
import 'package:moomalpublication/routes/routing.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          CustomAppbar(
            title: "Event And Press Release",
            prefixIcon: AppAssets.icBackArrow,
            onPrefixIconClick: () => AppRouting.navigateBack(),
            maxLine: 1,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: scaleHeight(10, context),
                    horizontal: scaleWidth(16, context)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: scaleHeight(10, context)),
                            child: const ContactCard(
                                contactImage: AppAssets.icEmail,
                                contactText: "ADDRESS:"),
                          );
                        }),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: scaleWidth(16, context)),
            child: CustomText(
              text: "© 2021 Moomal Publication All rights reserved",
              textStyle: CustomTextStyle.textStyle20SemiMedium(context,
                  color: Colors.grey),
            ),
          ),
        ],
      )),
    );
  }
}
