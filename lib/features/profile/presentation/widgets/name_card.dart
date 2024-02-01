import 'package:flutter/material.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/theme/text_fields.dart';
import 'package:moomalpublication/features/cart/presentation/widgets/shadow_container.dart';

class NameCardField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String icon;
  final String hintText;
  final String? label;
  final bool isPassword;
  final bool isReadOnly;

  const NameCardField({
    super.key,
    required BuildContext context,
    required this.icon,
    required this.hintText,
    this.label,
    this.textEditingController,
    this.isPassword = false,
    this.isReadOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: scaleHeight(18, context)),
      child: ShadowContainer(
        borderRadius: scaleRadius(10, context),
        containerChild: customTextFormField(
          context,
          textEditingController,
          borderRadius: 10,
          prefixIcon: icon,
          hint: hintText,
          label: label,
          isReadOnly: isReadOnly,
          isPasswordField: isPassword,
          hintTextStyle: CustomTextStyle.textStyle22Bold(context),
        ),
      ),
    );
  }
}
