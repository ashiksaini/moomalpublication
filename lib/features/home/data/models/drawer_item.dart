import 'package:moomalpublication/features/home/data/constants/drawer_item_type.dart';

class DrawerItem {
  String icon;
  String title;
  DrawerItemType drawerItemType;

  DrawerItem({
    required this.icon,
    required this.title,
    required this.drawerItemType,
  });
}
