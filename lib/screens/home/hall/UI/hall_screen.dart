import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';

class HallScreen extends StatelessWidget {
  const HallScreen({super.key});

  static const routeName = 'hall';
  static const routePath = routeName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Assets.images.homeFake.provider(),
            fit: BoxFit.fill
          ),
        ),
      ),
    );
  }
}
