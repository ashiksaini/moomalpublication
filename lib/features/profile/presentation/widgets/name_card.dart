import 'package:flutter/material.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/theme/text_fields.dart';
import 'package:moomalpublication/features/cart/presentation/widgets/shadow_container.dart';

class NameCardField extends StatelessWidget {
  const NameCardField({
    super.key,
    required BuildContext context,
    required this.textEditingController,
    required this.icon,
    required this.hintText,
    this.isPassword = false,
  });
  final TextEditingController textEditingController;
  final String icon;
  final String hintText;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: scaleHeight(18, context)),
      child: ShadowContainer(
        borderRadius: scaleRadius(10, context),
        containerChild: customTextFormField(context, textEditingController,
            borderRadius: 10,
            prefixIcon: icon,
            hint: hintText,
            isPasswordField: isPassword,
            hintTextStyle: CustomTextStyle.textStyle22Bold(context)),
      ),
    );
  }
}
