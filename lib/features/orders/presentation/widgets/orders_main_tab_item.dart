import 'package:flutter/widgets.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/box_shadows.dart';
import 'package:moomalpublication/core/theme/colors.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/orders/data/constants/enums.dart';

class OrdersMainTabItem extends StatelessWidget {
  final String title;
  final OrdersMainTabType orderMainTabType;
  final Function onClick;
  final bool isSelected;

  const OrdersMainTabItem({
    super.key,
    required this.title,
    required this.orderMainTabType,
    required this.onClick,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(orderMainTabType),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 26.h, vertical: 12.v),
        decoration: BoxDecoration(
            color: isSelected ? AppColors.orange : AppColors.white,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
                color: isSelected ? AppColors.white : AppColors.grey),
            boxShadow: isSelected ? [primaryBoxShadow()] : null),
        child: Center(
          child: CustomText(
            text: title,
            textStyle: CustomTextStyle.textStyle20Bold(
              context,
              color: isSelected ? AppColors.white : AppColors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
