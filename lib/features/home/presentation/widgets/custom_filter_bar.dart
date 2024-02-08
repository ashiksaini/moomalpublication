import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/bottom_sheets/advance_filter.dart';
import 'package:moomalpublication/core/components/organisms/custom_drop_down_1.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/horizontal_space.dart';
import 'package:moomalpublication/features/home/controllers/home_controller.dart';
import 'package:moomalpublication/features/home/data/constants/drop_down_item_type.dart';

class CustomFilterBar extends StatelessWidget {
  CustomFilterBar({super.key});

  final HomeController _homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomDropDown1<ExamType>(
          items: _homeController.exams,
          selectedItem: _homeController.selectedExam,
          width: screenWidth(context) / 2.4,
        ),
        const HorizontalGap(size: 4),
        CustomDropDown1<BookType>(
          items: _homeController.books,
          selectedItem: _homeController.selectedBook,
          width: screenWidth(context) / 2.9,
        ),
        const HorizontalGap(size: 4),
        GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (_) {
                    return Wrap(
                      children: [AdvanceFilterBottomSheet()],
                    );
                  });
            },
            child: SvgPicture.asset(AppAssets.icFilter))
      ],
    );
  }
}
