import 'package:acb/screens/home/UI/home_screen.dart';
import 'package:acb/screens/login/UI/login_screen.dart';
import 'package:acb/screens/splash/UI/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go_router/go_router.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

// GoRouter configuration
final _router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: SplashScreen.routeName,
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
          routes: [],
        ),
      ],
    ),

    // Example for Nested navigation
    /*ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return BottomNavigationScreen(child: child);
      },
      routes: <RouteBase>[
        GoRoute(
          path: HomeScreen.routePath,
          name: HomeScreen.routeName,
          builder: (context, state) => const HomeScreen(),
          routes: [
            GoRoute(
              path: DetailsScreen.routePath,
              builder: (context, state) => const DetailsScreen(label: 'Home'),
            ),
          ],
        ),
      ],
    ),*/
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      // Use these imports instead of the below one since The AppLocalizations class
      // also provides auto-generated localizationsDelegates and supportedLocales lists
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      /*localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      ),
      supportedLocales: const [
        Locale('en'), // English
        Locale('vi'), // Vietnamese
      ],*/

      // Comment this one since GoRouter is implemented
      // home: Login(),
    );
  }
}
