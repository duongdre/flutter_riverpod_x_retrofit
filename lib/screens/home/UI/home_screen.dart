import 'package:acb/main.dart';
import 'package:acb/screens/login/UI/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../widgets/buttons/button_blue_rouned_shared.dart';
import '../../../widgets/buttons/button_icon_with_text_shared.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../controller/home_screen_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  // Since Home is the first screen, the path have to be "/routeName"
  // The other screens's routePaths would be "reouteName"
  static const routeName = 'home';
  static const routePath = '/$routeName';

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late FirebaseFirestore db;
  bool isVisible = true;
  String allProducts = "";

  @override
  void initState() {
    // FirebaseFirestore.setLoggingEnabled(true);

    // ref.read(homeCardSlideNotifierProvider.notifier).startNotify();

    db = FirebaseFirestore.instance;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      precacheImage(Assets.images.loginCard1.provider(), context);
      precacheImage(Assets.images.loginCard2.provider(), context);
      precacheImage(Assets.images.loginCard3.provider(), context);

      ref.read(homeCardSlideNotifierProvider.notifier).startNotify();

      allProducts = ref.watch(currentRouteProvider);

    });

    super.initState();
  }

  @override
  void dispose() {
    print("_HomeScreen => dispose()");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("_HomeScreen => build()");
    }


    // Set up a listener for currentRouteProvider to detect route changes
    ref.listen<String>(
      currentRouteProvider,
          (previousRoute, currentRoute) {
        if (previousRoute != currentRoute) {
          print('previousRoute - $previousRoute');
          print('currentRoute - $currentRoute');
        }
      },
    );

    // precacheImage(Assets.images.loginCard1.provider(), context);
    // precacheImage(Assets.images.loginCard2.provider(), context);
    // precacheImage(Assets.images.loginCard3.provider(), context);

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
                      child: Assets.images.acbOneWhite.image(),
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
                      /*CardSlideShared(
                          provider: homeScreenNotifierProvider,
                          images: [
                            Assets.images.loginCard1.provider(),
                            Assets.images.loginCard2.provider(),
                            Assets.images.loginCard3.provider(),
                          ],
                          height: 90,
                        )*/
                      child: _getCardSlide(context),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 32, left: 16, right: 16, bottom: 32),
                      child: ButtonBlueRounedShared(
                          height: 60,
                          width: double.infinity,
                          onTap: () {
                            ref.read(homeCardSlideNotifierProvider.notifier).stopNotify();
                            context.goNamed(LoginScreen.routeName);
                          },
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

  Widget _getCardSlide(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final homeCardSlideNotifier = ref.watch(homeCardSlideNotifierProvider);
        final value = homeCardSlideNotifier.value;
        return Center(
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Container(
              height: 90,
              color: Colors.transparent,
              child: _getCard(value),
            ),
          ),
        );
      },
    );
  }

  Widget _getCard(ImageProvider<Object> value) {
    print("HomeScreen _getCard $value");
    return Container(
      height: 90,
      color: Colors.transparent,
      child: Image(image: value),
    );
  }
}
