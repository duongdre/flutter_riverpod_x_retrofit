import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'custom_animation_provider.g.dart';

@riverpod
class FaceIDAnimationNotifier extends _$FaceIDAnimationNotifier {

  @override
  bool build() {
    return false;
  }

  void startAnimation() {
    state = true;
  }

  void stopAnimation() {
    state = false;
  }
}