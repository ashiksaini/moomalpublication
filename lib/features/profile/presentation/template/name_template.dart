import 'package:flutter/material.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/features/profile/presentation/widgets/name_card.dart';
import 'package:moomalpublication/features/profile/presentation/widgets/submit_button.dart';

class NameTemplate extends StatelessWidget {
  NameTemplate({super.key});
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NameCardField(
            context: context,
            textEditingController: textEditingController,
            icon: AppAssets.icUser,
            hintText: 'Full Name'),
        NameCardField(
            context: context,
            textEditingController: textEditingController,
            icon: AppAssets.icEmail,
            hintText: 'designer1@gmail.com'),
        NameCardField(
            context: context,
            textEditingController: textEditingController,
            icon: AppAssets.icPassword,
            isPassword: true,
            hintText: 'Password'),
        SizedBox(
          height: scaleHeight(72, context),
        ),
        const SubmitButton(),
      ],
    );
  }
}
