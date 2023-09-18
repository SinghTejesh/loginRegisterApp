import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_screen/scaffold_with_nested_navigation.dart';
import 'package:login_screen/screns/home_page.dart';
import 'package:login_screen/screns/login_screen.dart';
import 'package:login_screen/screns/profile_screen.dart';
import 'package:login_screen/screns/registration_screen.dart';
import 'package:login_screen/screns/setting_screen.dart';
import 'package:login_screen/screns/splash_screen.dart';


class AppRouter {
    static const String splashScreen = '/';
  static const String loginScreen = '/loginScreen';
  static const String registration = '/registration';
  static const String homeScreen = '/homeScreen';
  static const  String profileScreen = '/profileScreen';
  static const String settingsScreen = '/settingScreen';

  static final GlobalKey<NavigatorState> _shellNavigatorAKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _shellNavigatorBKey = GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _shellNavigatorCKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(

    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNestedNavigation(
              navigationShell: navigationShell, context: context,);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorAKey,
            routes: [
              GoRoute(
                path: homeScreen,
                pageBuilder: (context, state) => const MaterialPage(child: HomePage()),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorBKey,
            routes: [
              GoRoute(
                path: profileScreen,
                pageBuilder: (context, state) => const MaterialPage(child: ProfileScreen()),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorCKey,
            routes: [
              GoRoute(
                path: settingsScreen,
                pageBuilder: (context, state) => const MaterialPage(child: SettingScreen()), // Replace with ProfileScreen
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: loginScreen,
        builder: (BuildContext context, GoRouterState state) {
          return Builder(
            builder: (context) => const LoginScreen(),
          );
        },
      ),
      GoRoute(
        path: registration,
        builder: (BuildContext context, GoRouterState state) {
          return Builder(
            builder: (context) => const RegistrationScreen(),
          );
        },
      ),
      GoRoute(
        path: splashScreen,
        builder: (BuildContext context, GoRouterState state) {
          return Builder(
            builder: (context) => SplashScreen(),
          );
        },
      ),

      ],
      );
}








// class AppRouter {
//   static const String splashScreen = '/';
//   static const String loginScreen = '/loginScreen';
//   static const String registration = '/registration';
//   static const String homeScreen = '/homeScreen';
//
//   static final GoRouter router = GoRouter(
//     routes: [
//       GoRoute(
//         name: splashScreen,
//         path: splashScreen,
//         builder: (context, state) {
//           return SplashScreen();
//         },
//       ),
//
//        GoRoute(
//         name: registration,
//         path: registration,
//         builder: (context, state) {
//           return const RegistrationScreen();
//         },
//       ),
//
//       GoRoute(
//         name: loginScreen,
//         path: loginScreen,
//         builder: (context, state) {
//           return const LoginScreen();
//         },
//       ),
//
//       GoRoute(
//         name: homeScreen,
//         path: homeScreen,
//         builder: (context, state) {
//           return const HomePage();
//         },
//       ),
//
//     ],
//   );
// }
