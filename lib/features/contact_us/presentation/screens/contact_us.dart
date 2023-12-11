import 'package:flutter/material.dart';
import 'package:moomalpublication/core/components/molecules/no_glow_behaviour.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/contact_us/presentation/templates/contact_us_card.dart';
import 'package:moomalpublication/features/contact_us/presentation/widgets/bottom_contact_bar.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppbar(
            title: "Contact Us",
            maxLine: 1,
            prefixIcon: AppAssets.icBackArrow,
          ),
          Expanded(
            child: ScrollConfiguration(
              behavior: NoGlowBehavior(),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: scaleWidth(15, context),
                      vertical: scaleHeight(20, context)),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ContactUsCard(
                          image: AppAssets.icLocation,
                          imageText: "ADDRESS",
                          text:
                              "50, Agrasen Nagar, Near Mahesh Nagar Phatak, Jaipur, (Rajasthan) 302015"),
                      ContactUsCard(
                          image: AppAssets.icEmail,
                          imageText: "EMAIL",
                          text: "info@moomalpublication.com"),
                      // ContactUsCard(
                      //     image: AppAssets.icEmail,
                      //     imageText: "EMAIL",
                      //     text: "info@moomalpublication.com"),
                      ContactUsCard(
                          image: AppAssets.icPhone,
                          imageText: "PHONE",
                          text:
                              "+91 70144 10554 (For any Technical issue WhatsApp only)"),
                      BottomDetailBar(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
