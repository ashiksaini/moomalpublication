import 'package:flutter/material.dart';
import 'package:moomalpublication/core/components/organisms/app_bar.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/profile/presentation/template/name_template.dart';
import 'package:moomalpublication/features/profile/presentation/widgets/cirular_conatiner.dart';
import 'package:moomalpublication/features/profile/presentation/widgets/profile_picture_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: scaleHeight(280, context),
                  ),
                  const CircularContainer(),
                  const CustomAppbar(
                    title: "My Profile",
                    maxLine: 1,
                    textAlign: TextAlign.center,
                  ),
                  Positioned(
                      bottom: 0,
                      left: scaleWidth(100, context),
                      child: const ProfilePicture()),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: scaleWidth(16, context),
                    vertical: scaleHeight(56, context)),
                child: Column(
                  children: [
                    NameTemplate(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
