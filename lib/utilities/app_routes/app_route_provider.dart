import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../screens/home/UI/home_screen.dart';
import '../../screens/login/UI/login_screen.dart';
import '../../screens/splash/UI/splash_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_route_provider.g.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

@riverpod
Uri currentRoute(ref) {
  return ref.watch(routeInformationProvider).value.uri;
}

final routeInformationProvider = ChangeNotifierProvider<GoRouteInformationProvider>((ref) {
  final router = ref.watch(routerProvider);
  return router.routeInformationProvider;
});

final routerProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: SplashScreen.routeName,
    // observers: [AppRouteObserver()],
    routes: [
      GoRoute(
        path: SplashScreen.routePath,
        name: SplashScreen.routeName,
        builder: (context, state) => const SplashScreen(),
        routes: [],
      ),
      GoRoute(
        path: HomeScreen.routePath,
        name: HomeScreen.routeName,
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: LoginScreen.routePath,
            name: LoginScreen.routeName,
            builder: (context, state) => const LoginScreen(),
            routes: [

            ],
          ),
        ],
      ),
    ],
  ),
);
