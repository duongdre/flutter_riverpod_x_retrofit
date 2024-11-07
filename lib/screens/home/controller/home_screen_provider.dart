import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:async';

import '../../../gen/assets.gen.dart';
import '../../../utilities/app_routes/app_route_provider.dart';
import '../UI/home_screen.dart';

part 'home_screen_provider.g.dart';

// Generated notifier providers

class NotifyState {
  final ImageProvider<Object> value;
  final bool isNotifying;

  NotifyState({required this.value, required this.isNotifying});
}

@riverpod
class HomeCardSlideNotifier extends _$HomeCardSlideNotifier {
  Timer? _timer;
  int _counter = 0;

  final cards = [
    Assets.images.loginCard1.provider(),
    Assets.images.loginCard2.provider(),
    Assets.images.loginCard3.provider(),
  ];

  @override
  NotifyState build() {
    print("HomeCardSlideNotifier => build()");

    state = NotifyState(value: getFirstIfNull(), isNotifying: false);

    ref.onDispose(() {
      _timer?.cancel();
    });

    final currentUri = ref.watch(currentRouteProvider);
    if (currentUri.toString() == HomeScreen.routePath) {
      startNotify();
    } else {
      stopNotify();
    }

    return state;
  }

  // Start notifying every second
  void startNotify() {
    print("HomeCardSlideNotifier => startNotify()");
    if (state.isNotifying == false) {
      state = NotifyState(value: state.value, isNotifying: true);
      _startTimer();
    }
  }

  // Stop notifying
  void stopNotify() {
    print("HomeCardSlideNotifier => startNotify()");
    _timer?.cancel();
    state = NotifyState(value: state.value, isNotifying: false);
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (time) {
      updateValue();
    });
  }

  void updateValue() {
    if (state.isNotifying) {
      // Increment counter and cycle it through 0, 1, 2
      _counter = (_counter + 1) % 3;
      state = NotifyState(value: cards[_counter], isNotifying: true);
    }
  }

  ImageProvider getFirstIfNull() {
    return cards[0];
  }
}
