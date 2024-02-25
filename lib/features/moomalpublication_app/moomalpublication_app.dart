import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/features/bottom_nav_bar/presentation/custom_bottom_nav_bar.dart';
import 'package:moomalpublication/features/cart/presentation/screens/cart_screen.dart';
import 'package:moomalpublication/features/ebook/presentation/screens/ebook_screen.dart';
import 'package:moomalpublication/features/home/presentation/screens/home_screen.dart';
import 'package:moomalpublication/features/profile/presentation/screens/profile_screen.dart';
import 'package:moomalpublication/features/shop/presentation/screens/shop_screen.dart';

class MoomalPublicationApp extends StatefulWidget {
  const MoomalPublicationApp({super.key});

  @override
  State<MoomalPublicationApp> createState() => _MoomalPublicationAppState();
}

class _MoomalPublicationAppState extends State<MoomalPublicationApp> {
  int _selectedIndex = 0;
  late List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _initPages();

    _selectedIndex = Get.arguments ?? 0;
  }

  Future<void> _initPages() async {
    _pages = [
      HomeScreen(),
      ShopScreen(),
      EBookScreen(),
      const CartScreen(),
      ProfileScreen(),
    ];
  }

  void _onTabChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onTabChanged: _onTabChanged,
      ),
    );
  }
}
