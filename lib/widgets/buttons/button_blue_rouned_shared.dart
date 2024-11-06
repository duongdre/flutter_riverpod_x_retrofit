import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../gen/colors.gen.dart';

class ButtonBlueRounedShared extends ConsumerWidget {
  final double height;
  final double width;
  final Text text;
  final VoidCallback onTap;

  const ButtonBlueRounedShared({
    super.key,
    required this.height,
    required this.width,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: ColorName.blueColor),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          // splashColor: ColorName.whiteColor,
          focusColor: ColorName.whiteColor,
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          child: Center(
            child: text,
          ),
        ),
      ),
    );
  }
}
