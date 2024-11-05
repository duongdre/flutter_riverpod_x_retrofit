import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../widgets/buttons/button_blue_rouned_shared.dart';
import '../../../widgets/buttons/button_icon_with_text_shared.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../widgets/buttons/card_slide_shared.dart';
import '../controller/login_provider.dart';

/*class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}*/

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  /*@override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      precacheImage(Assets.images.loginCard1.provider(), context);
      precacheImage(Assets.images.loginCard2.provider(), context);
      precacheImage(Assets.images.loginCard3.provider(), context);
    });

    super.initState();
  }*/

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (kDebugMode) {
      print("_LoginScreenState => build()");
    }

    precacheImage(Assets.images.loginCard1.provider(), context);
    precacheImage(Assets.images.loginCard2.provider(), context);
    precacheImage(Assets.images.loginCard3.provider(), context);

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
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// loginHeaderViewElement
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
                      margin: const EdgeInsets.only(top: 10),
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

              /// loginFooterViewElement
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: CardSlideShared(
                        provider: loginNotifierProvider,
                        images: [
                          Assets.images.loginCard1.provider(),
                          Assets.images.loginCard2.provider(),
                          Assets.images.loginCard3.provider(),
                        ],
                        height: 90,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 32, left: 16, right: 16, bottom: 32),
                      child: ButtonBlueRounedShared(
                          height: 60,
                          width: double.infinity,
                          onTap: () {},
                          text: Text(
                            AppLocalizations.of(context)!.login,
                            style: const TextStyle(
                                // fontFamily: FontFamily.raleway,
                                fontSize: 20,
                                color: ColorName.whiteColor,
                                fontWeight: FontWeight.w600),
                          )),
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
                          text: Text(
                            AppLocalizations.of(context)!.loginGetOtp,
                            style:
                                const TextStyle(color: ColorName.whiteColor, fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                          onPressed: () {},
                        ),
                        ButtonIconWithTextShared(
                          height: 30,
                          width: 30,
                          icon: const Icon(
                            Icons.how_to_reg,
                            color: ColorName.whiteColor,
                          ),
                          text: Text(
                            AppLocalizations.of(context)!.loginGetRegister,
                            style:
                                const TextStyle(color: ColorName.whiteColor, fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                          onPressed: () {},
                        ),
                        ButtonIconWithTextShared(
                          height: 30,
                          width: 30,
                          icon: const Icon(
                            Icons.qr_code_scanner,
                            color: ColorName.whiteColor,
                          ),
                          text: Text(
                            AppLocalizations.of(context)!.loginGetQr,
                            style:
                                const TextStyle(color: ColorName.whiteColor, fontSize: 16, fontWeight: FontWeight.w700),
                          ),
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
