import 'dart:async';

import 'package:acb/gen/colors.gen.dart';
import 'package:acb/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../gen/assets.gen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const routeName = '/';
  static const routePath = routeName;

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 1), () {
      // context.goNamed(HomeScreen.routePath);
      context.go('/home');
    });

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        // Add your splash screen UI components here
        color: Colors.black,
        child: Image(
          image: Assets.images.splashAcb.provider(),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}