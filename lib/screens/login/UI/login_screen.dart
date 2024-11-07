import 'package:acb/main.dart';
import 'package:acb/screens/home/UI/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  static const routeName = 'login';
  static const routePath = routeName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            context.goNamed(HomeScreen.routeName);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_sharp,
            color: ColorName.blueColor,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              width: 40,
            ),
            Center(
              child: SizedBox(
                height: 24,
                child: Image(
                  image: Assets.images.acbOneColors.provider(),
                ),
              ),
            ),
            const SizedBox(
              width: 40,
            ),
            const SizedBox(
              height: 28,
              width: 28,
              child: FittedBox(
                child: Icon(
                  Icons.logout_sharp,
                  color: ColorName.blueColor,
                ),
              ),
            ),
          ],
        ),
        // actions: [

        // ],
      ),
      body: Container(),
    );
  }
}
