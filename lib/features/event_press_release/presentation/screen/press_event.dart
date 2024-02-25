import 'package:flutter/material.dart';
import 'package:moomalpublication/features/event_press_release/presentation/template/press_event_card.dart';

class PressEvent extends StatelessWidget {
  const PressEvent({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return PressEventCard(
      index: index,
      // withGradient: true,
    );
  }
}
