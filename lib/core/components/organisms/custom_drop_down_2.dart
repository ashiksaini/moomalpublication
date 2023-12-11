import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/box_shadows.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';
import 'package:moomalpublication/features/home/data/models/drop_down_item.dart';

/// Custom Dropdown
/// Parent View ---> Have a background with boder,
/// Child View ---> Have a divdier between items,
class CustomDropDown2<T> extends StatelessWidget {
  final List<DropdownItem<T>> items;
  final Rx<DropdownItem<T>?> selectedItem;
  final Color color;
  final double? width;

  const CustomDropDown2({
    super.key,
    required this.items,
    required this.selectedItem,
    this.color = AppColors.white,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return DropdownButtonHideUnderline(
        child: DropdownButton2<DropdownItem<T>>(
          customButton: Container(
            width: width ?? screenWidth(context) / 2.6,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(scaleRadius(10, context)),
              border: Border.all(color: AppColors.grey),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: scaleWidth(10, context),
              vertical: scaleHeight(10, context),
            ),
            child: Row(
              children: [
                // Title
                Expanded(
                  child: CustomText(
                    text: selectedItem.value!.title,
                    textStyle: CustomTextStyle.textStyle18Bold(context),
                    textAlign: TextAlign.start,
                    maxLines: 1,
                  ),
                ),
                const HorizontalGap(size: 2),

                // DD Icon
                SvgPicture.asset(
                  AppAssets.icDropDown,
                  height: scaleHeight(20, context),
                  width: scaleWidth(20, context),
                ),
              ],
            ),
          ),
          items: items.map((item) {
            return DropdownMenuItem(
              value: item,
              onTap: () {
                selectedItem.value = item;
              },
              child: StatefulBuilder(
                builder: (context, menuSetState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          left: scaleWidth(15, context),
                          right: scaleWidth(10, context),
                          top: scaleHeight(8, context),
                          bottom: scaleHeight(7, context),
                        ),
                        child: CustomText(
                          text: item.title.toString(),
                          textStyle: CustomTextStyle.textStyle18Bold(context, color: AppColors.grey),
                          textAlign: TextAlign.start,
                          maxLines: 1,
                        ),
                      ),
                      Divider(height: scaleHeight(2, context), thickness: scaleHeight(2, context)),
                    ],
                  );
                },
              ),
            );
          }).toList(),
          onChanged: (value) {
            selectedItem.value = value!;
          },
          dropdownStyleData: DropdownStyleData(
            padding: EdgeInsets.zero,
            scrollPadding: EdgeInsets.zero,
            maxHeight: scaleHeight(250, context),
            width: width ?? screenWidth(context),
            offset: const Offset(0, 0),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(scaleRadius(10, context)),
              boxShadow: [primaryBoxShadow()],
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            padding: EdgeInsets.zero,
          ),
        ),
      );
    });
  }
}
