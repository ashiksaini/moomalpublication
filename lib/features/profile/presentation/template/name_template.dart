import 'package:flutter/material.dart';
import 'package:moomalpublication/core/constants/assets.dart';
import 'package:moomalpublication/features/profile/presentation/widgets/name_card.dart';

class NameTemplate extends StatelessWidget {
  final String userName;
  final String userEmail;

  const NameTemplate({
    super.key,
    required this.userName,
    required this.userEmail,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NameCardField(
          context: context,
          icon: AppAssets.icUser,
          hintText: userName,
          isReadOnly: true,
        ),
        NameCardField(
          context: context,
          icon: AppAssets.icEmail,
          hintText: userEmail,
          isReadOnly: true,
        ),
        // SizedBox(
        //   height: 72.v,
        // ),
        // const SubmitButton(),
      ],
    );
  }
}
