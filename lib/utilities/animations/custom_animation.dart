import 'package:acb/gen/colors.gen.dart';
import 'package:acb/screens/home/UI/home_screen.dart';
import 'package:acb/utilities/animations/custom_animation_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../../gen/assets.gen.dart';

class ScaffoldFaceIDWrapper extends ConsumerStatefulWidget {
  const ScaffoldFaceIDWrapper({
    super.key,
    required this.appBar,
    required this.body,
    required this.method,
  });

  final PreferredSizeWidget appBar;
  final Widget body;
  final void Function() method;

  @override
  ConsumerState<ScaffoldFaceIDWrapper> createState() => _ScaffoldFaceIDWrapperState();
}

class _ScaffoldFaceIDWrapperState extends ConsumerState<ScaffoldFaceIDWrapper> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isShowingFaceID = ref.watch(faceIDAnimationNotifierProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: widget.appBar,
      // backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          widget.body,
          if (isShowingFaceID)
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Center(
                // child: Lottie.asset(Assets.animations.faceIdAnimation.path),
                child: Container(
                  padding: EdgeInsets.only(top: 20, left: 28, right: 28, bottom: 20),
                  decoration: BoxDecoration(
                    color: ColorName.loginTextColorGray.withOpacity(0.75),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Lottie.asset(
                        Assets.animations.faceIdAnimation.path,
                        controller: _controller,
                        onLoaded: (composition) {
                          _controller
                            ..duration = composition.duration
                            ..forward()
                                .whenComplete(() {
                              ref.read(faceIDAnimationNotifierProvider.notifier).stopAnimation();
                              widget.method();
                            });
                        },
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Face ID",
                        style: TextStyle(
                            fontFamily: Assets.fonts.ralewayExtralight,
                            color: ColorName.loginIconColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
