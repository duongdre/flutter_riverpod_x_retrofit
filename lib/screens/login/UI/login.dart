import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../widgets/buttons/button_icon_with_text_shared.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Assets.images.bgLogin.provider(),
                fit: BoxFit.cover,
              ),
            ),
            child: null /* add child content here */,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 65,
                      width: 65,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: ColorName.blueColor.withOpacity(0.2),
                          backgroundBlendMode: BlendMode.darken),
                      child: const Icon(
                        size: 40,
                        Icons.photo_library_outlined,
                        color: ColorName.whiteColor,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      width: 200,
                      child: Assets.images.acbone.image(),
                    ),
                    Container(
                      height: 120,
                      width: 65,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ColorName.blueColor.withOpacity(0.2),
                          backgroundBlendMode: BlendMode.darken),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            size: 45,
                            Icons.storefront_outlined,
                            color: ColorName.whiteColor,
                          ),
                          Icon(
                            size: 45,
                            Icons.more_horiz_rounded,
                            color: ColorName.whiteColor,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      width: double.infinity,
                      margin: const EdgeInsets.only(
                          top: 32, left: 16, right: 16, bottom: 32),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: ColorName.blueColor),
                      child: const Center(
                        child: Text(
                          'ĐĂNG NHẬP',
                          style: TextStyle(
                              // fontFamily: FontFamily.raleway,
                              fontSize: 20,
                              color: ColorName.whiteColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonIconWithTextShared(
                          height: 30,
                          width: 30,
                          icon: const Icon(
                            Icons.shield_outlined,
                            color: ColorName.whiteColor,
                          ),
                          text: "Lấy OTP",
                          onPressed: () {},
                        ),
                        ButtonIconWithTextShared(
                          height: 30,
                          width: 30,
                          icon: const Icon(
                            Icons.how_to_reg,
                            color: ColorName.whiteColor,
                          ),
                          text: "Đăng ký",
                          onPressed: () {},
                        ),
                        ButtonIconWithTextShared(
                          height: 30,
                          width: 30,
                          icon: const Icon(
                            Icons.qr_code_scanner,
                            color: ColorName.whiteColor,
                          ),
                          text: "Mã QR",
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
