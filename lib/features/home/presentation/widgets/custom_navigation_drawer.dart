import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/home/presentation/widgets/custom_drawer_header.dart';
import 'package:moomalpublication/features/home/presentation/widgets/drawer_item.dart';

class CustomNavigationDrawer extends Drawer {
  const CustomNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.black,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Header
          SizedBox(
            height: scaleHeight(100, context),
            child: DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.symmetric(
                  horizontal: scaleWidth(10, context),
                  vertical: scaleHeight(10, context)),
              child: const CustomDrawerHeader(
                  userImage: AppAssets.icImg,
                  userName: "Ashik Saini",
                  userPhNumber: "9982696197"),
            ),
          ),

          // Builder
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (_, index) {
              return Container(
                margin: EdgeInsets.only(bottom: scaleHeight(30, context)),
                padding:
                    EdgeInsets.symmetric(horizontal: scaleWidth(10, context)),
                child: CustomDrawerItem(
                  icon: AppAssets.icEditNavDrawer,
                  title: "title",
                  onTap: () => printError(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
