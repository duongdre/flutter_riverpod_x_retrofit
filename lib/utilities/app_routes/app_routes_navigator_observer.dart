import 'package:acb/utilities/app_routes/app_routes_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class AppRoutesNavigatorObserver extends NavigatorObserver {
  final WidgetRef ref; // Reference to access Riverpod state

  AppRoutesNavigatorObserver({required this.ref});

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    print('NavigatorObserver Popped: $route');
    // Trigger a method in Riverpod state notifier when a screen is popped
    ref.read(appRouteStateNotifierProvider.notifier).onPop(route.settings.name ?? '/');
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    print('NavigatorObserver Pushed: $route');
    // Trigger a method in Riverpod state notifier when a screen is pushed
    ref.read(appRouteStateNotifierProvider.notifier).onPush(route.settings.name ?? '/');
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    print('NavigatorObserver Removed: $route');
    // Optionally handle when a route is removed
  }
}