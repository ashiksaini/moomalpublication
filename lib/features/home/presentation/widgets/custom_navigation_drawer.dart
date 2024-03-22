import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/home/controllers/home_controller.dart';
import 'package:moomalpublication/features/home/presentation/widgets/custom_drawer_header.dart';
import 'package:moomalpublication/features/home/presentation/widgets/drawer_item.dart';

class CustomNavigationDrawer extends Drawer {
  CustomNavigationDrawer({super.key});

  final HomeController _homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: SizeUtils.width / 1.8,
      backgroundColor: AppColors.black,
      shape: const RoundedRectangleBorder(),
      child: Column(
        children: [
          // Header
          SizedBox(
            height: 150.v,
            child: DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.v),
              child: CustomDrawerHeader(
                userImage: _homeController.userAvatar.value,
                userName: _homeController.userName.value,
              ),
            ),
          ),

          // Builder
          Expanded(
            child: ListView.builder(
              itemCount: _homeController.drawerItems.length,
              itemBuilder: (_, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 30.v),
                  padding: EdgeInsets.symmetric(horizontal: 10.h),
                  child: CustomDrawerItem(
                    drawerItem: _homeController.drawerItems[index],
                    onItemClick: (drawerItemType) {
                      _homeController.onDrawerItemClick(drawerItemType);
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
