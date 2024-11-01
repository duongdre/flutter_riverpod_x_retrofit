import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../gen/colors.gen.dart';

class ButtonIconWithTextShared extends ConsumerWidget {
  final double height;
  final double width;
  final String text;
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

  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        SizedBox(
          height: height,
          width: width,
          child: SizedBox.fromSize(
            size: const Size.fromRadius(100),
            child: FittedBox(
              child: icon,
            ),
          ),
        ),
        Text(
          text,
          style: TextStyle(
              color: ColorName.whiteColor,
              fontSize: 16,
              fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}
