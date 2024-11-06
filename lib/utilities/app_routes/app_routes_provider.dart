import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../main.dart';
import '../../screens/home/UI/home_screen.dart';
import '../../screens/login/UI/login_screen.dart';
import '../../screens/splash/UI/splash_screen.dart';

part 'app_routes_provider.g.dart';

// Generated notifier providers

@riverpod
class AppRouteStateNotifier extends _$AppRouteStateNotifier {
  @override
  String build() {
    return '/'; // Initial screen state can be an empty string or default value.
  }

  // Method to handle the screen push event
  void onPush(String screenName) {
    print('Screen pushed: $screenName');
    state = screenName; // Update state with the current screen name
  }

  // Method to handle the screen pop event
  void onPop(String screenName) {
    print('Screen popped: $screenName');
    state = '/'; // Reset state or set previous screen if needed
  }
}


class AppRoutesObserver extends AutoRouterObserver {
  @override
  void didPop(Route route, Route? previousRoute) {
    print('New route pop: ${route.settings.name}');
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    print('New route pushed: ${route.settings.name}');
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    print('New route pushNext: ${oldRoute} to ${newRoute}');
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    print('New route pushNext: ${previousRoute}');
  }
}