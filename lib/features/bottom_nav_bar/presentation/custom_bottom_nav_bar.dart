import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/vertical_space.dart';
import 'package:moomalpublication/features/bottom_nav_bar/data/models/nav_item.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int? selectedIndex;
  final ValueChanged<int>? onTabChanged;

  const CustomBottomNavBar({
    super.key,
    this.selectedIndex,
    this.onTabChanged,
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  final Color selectedColor = AppColors.orange;
  final Color unselectedColor = AppColors.black;
  late List<BottomNavItem> _navItems = [];

  @override
  void initState() {
    super.initState();
    _generateNavItems();
  }

  Future<void> _generateNavItems() async {
    final home = BottomNavItem(icon: AppAssets.icHome, label: 'home'.tr);
    final shop = BottomNavItem(icon: AppAssets.icShop, label: 'shop'.tr);
    final ebook = BottomNavItem(icon: AppAssets.icEBook, label: 'ebook'.tr);
    final cart = BottomNavItem(icon: AppAssets.icCart, label: 'cart'.tr);
    final profile =
        BottomNavItem(icon: AppAssets.icProfile, label: 'profile'.tr);

    _navItems = [home, shop, ebook, cart, profile];
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 8.v),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Row(
            children: _buildNavItems(),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildNavItems() {
    return _navItems.asMap().entries.map((entry) {
      final int index = entry.key;
      final BottomNavItem navItem = entry.value;

      return Expanded(
        child: GestureDetector(
          onTap: () {
            widget.onTabChanged!(index);
          },
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                SvgPicture.asset(
                  navItem.icon,
                  colorFilter: widget.selectedIndex == index
                      ? ColorFilter.mode(selectedColor, BlendMode.srcIn)
                      : ColorFilter.mode(unselectedColor, BlendMode.srcIn),
                ),
                const VerticalGap(size: 2),
                CustomText(
                  text: navItem.label,
                  textStyle: CustomTextStyle.textStyle12Regular(context),
                ),
              ],
            ),
          ),
        ),
      );
    }).toList();
  }
}
