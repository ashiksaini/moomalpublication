import 'package:flutter/material.dart';
import 'package:moomalpublication/core/theme/colors.dart';

class CommonBottomSheet {
  Future<dynamic> commonbottomSheet(
      BuildContext context, Widget insideComponent,
      {Function? onBack, required bool isDismissible}) {
    return showModalBottomSheet(
        isDismissible: isDismissible,
        enableDrag: false,
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(12.0),
          ),
        ),
        backgroundColor: AppColors.white,
        builder: (context) {
          return WillPopScope(
              child: Padding(
                padding: MediaQuery.of(context).viewInsets,
                
                child: insideComponent,
              ),
              onWillPop: () async {
                if (onBack != null) {
                  onBack();
                }
                return true;
              });
        });
  }
}
