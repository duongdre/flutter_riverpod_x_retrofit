import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ButtonIconWithTextShared extends ConsumerWidget {
  final double height;
  final double width;
  final Text text;
  final Icon icon;
  final VoidCallback onPressed;

  const ButtonIconWithTextShared({
    super.key,
    required this.height,
    required this.icon,
    required this.width,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        SizedBox(
          height: height,
          width: width,
          child: FittedBox(
            child: icon,
          ),
        ),
        text
      ],
    );
  }
}
