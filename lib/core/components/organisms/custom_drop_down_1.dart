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
/// Parent View ---> Have a background with no boder,
/// Child View ---> Have a divdier between items,
class CustomDropDown1<T> extends StatelessWidget {
  final List<DropdownItem<T>> items;
  final Rx<DropdownItem<T>?> selectedItem;
  final Color color;
  final double? width;

  const CustomDropDown1({
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
            width: width ?? SizeUtils.width / 2.6,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10.r),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 10.h,
              vertical: 10.v,
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
                  height: 20.v,
                  width: 20.h,
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
                          left: 15.h,
                          right: 10.h,
                          top: 8.v,
                          bottom: 7.v,
                        ),
                        child: CustomText(
                          text: item.title.toString(),
                          textStyle: CustomTextStyle.textStyle18Bold(context,
                              color: AppColors.grey),
                          textAlign: TextAlign.start,
                          maxLines: 1,
                        ),
                      ),
                      Divider(
                          height: 2.v,
                          thickness: 2.v),
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
            maxHeight: 250.v,
            width: (width ?? width),
            offset: const Offset(0, 0),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10.r),
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
