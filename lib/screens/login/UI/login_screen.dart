import 'dart:async';

import 'package:acb/main.dart';
import 'package:acb/screens/home/UI/home_screen.dart';
import 'package:acb/screens/home/hall/UI/hall_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../utilities/animations/custom_animation.dart';
import '../../../utilities/animations/custom_animation_provider.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  static const routeName = 'login';
  static const routePath = routeName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScaffoldFaceIDWrapper(
      method: () {
        context.goNamed(HallScreen.routeName);
      },
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
      ),
      body: Container(
        padding: EdgeInsets.only(top: 28, left: 16, right: 16),
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: ColorName.loginAvatarBackGround,
                child: Text(
                  'ND',
                  style: TextStyle(
                      fontFamily: Assets.fonts.ralewayLight,
                      color: ColorName.whiteColor,
                      fontWeight: FontWeight.w300,
                      fontSize: 16),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Xin chào",
                style: TextStyle(
                    fontFamily: Assets.fonts.ralewayLight,
                    color: ColorName.loginTextColorBlue,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "NGUYEN ANH DUONG",
                style: TextStyle(
                    fontFamily: Assets.fonts.ralewayLight,
                    color: ColorName.loginTextColorBlue,
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.remove_red_eye),
                  hintText: "Mật khẩu",
                  hintStyle: TextStyle(
                      fontFamily: Assets.fonts.ralewayLight,
                      color: ColorName.loginTextColorBlue,
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: ColorName.loginTextColorBlue.withOpacity(0.2)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: ColorName.loginTextColorBlue.withOpacity(0.2)),
                  ),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Row(
                children: [
                  Flexible(
                    flex: 5,
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: ColorName.loginButtonDisable,
                        border: Border(
                          top: BorderSide(color: ColorName.loginIconColorGray.withOpacity(0.2)),
                          left: BorderSide(color: ColorName.loginIconColorGray.withOpacity(0.2)),
                          bottom: BorderSide(color: ColorName.loginIconColorGray.withOpacity(0.2)),
                        ), // Border color and width
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(100), // Round top-left corner
                          bottomLeft: Radius.circular(100), // Round top-right corner
                        ),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          // splashColor: ColorName.whiteColor,
                          focusColor: ColorName.loginIconColorGray,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(100), // Round top-left corner
                            bottomLeft: Radius.circular(100), // Round top-right corner
                          ),
                          child: Center(
                            child: Text(
                              'ĐĂNG NHẬP',
                              style: TextStyle(
                                fontFamily: Assets.fonts.ralewayLight,
                                color: ColorName.whiteColor,
                                fontWeight: FontWeight.w900,
                                fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: ColorName.loginIconColorGray.withOpacity(0.2)),
                          right: BorderSide(color: ColorName.loginIconColorGray.withOpacity(0.2)),
                          bottom: BorderSide(color: ColorName.loginIconColorGray.withOpacity(0.2)),
                        ),
                        // Border color and width
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(100), // Round top-left corner
                          bottomRight: Radius.circular(100), // Round top-right corner
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          ref.read(faceIDAnimationNotifierProvider.notifier).startAnimation();
                        },
                        // splashColor: ColorName.whiteColor,
                        focusColor: ColorName.loginIconColorGray,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(100), // Round top-left corner
                          bottomLeft: Radius.circular(100), // Round top-right corner
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Image(
                            image: Assets.images.faceId.provider(),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Quên thông tin đăng nhập?',
                style: TextStyle(
                    fontFamily: Assets.fonts.ralewayLight,
                    color: ColorName.loginTextColorGray,
                    fontWeight: FontWeight.w400,
                    fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
