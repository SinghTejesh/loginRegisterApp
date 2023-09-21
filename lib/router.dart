import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:login_screen/scaffold_with_nested_navigation.dart';
import 'package:login_screen/screns/home_page.dart';
import 'package:login_screen/screns/login_screen.dart';
import 'package:login_screen/screns/profile_screen.dart';
import 'package:login_screen/screns/registration_screen.dart';
import 'package:login_screen/screns/setting_screen.dart';
import 'package:login_screen/screns/splash_screen.dart';

final mainNavigatorKeyProvider = Provider<GlobalKey<NavigatorState>>((ref) {
  return GlobalKey<NavigatorState>(debugLabel: 'check main navigator');
});

class AppRouter {
  static const String splashScreen = '/';
  static const String loginScreen = '/loginScreen';
  static const String registration = '/registration';
  static const String homeScreen = '/homeScreen';
  static const String profileScreen = '/profileScreen';
  static const String settingsScreen = '/settingScreen';

  final goRouterProvider = Provider.autoDispose<GoRouter>((ref) {
    final router = GoRouter(
      navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'Check'),
      //ref.watch(mainNavigatorKeyProvider), // Use a single navigator key
      // initialLocation: '/',
      // navigatorKey: _shellNavigatorAKey,
      routes: [
        GoRoute(
          path: splashScreen,
          builder: (BuildContext context, GoRouterState state) {
            return Builder(
              builder: (context) => SplashScreen(),
            );
          },
        ),
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return ScaffoldWithNestedNavigation(
              navigationShell: navigationShell,
              //context: context,
            );
          },
          branches: [
            StatefulShellBranch(
              navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'A'),
              routes: [
                GoRoute(
                  path: homeScreen,
                  pageBuilder: (context, state) =>
                      const MaterialPage(child: HomePage()),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'B'),
              routes: [
                GoRoute(
                  path: profileScreen,
                  pageBuilder: (context, state) =>
                      const MaterialPage(child: ProfileScreen()),
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'C'),
              routes: [
                GoRoute(
                  path: settingsScreen,
                  pageBuilder: (context, state) => const MaterialPage(
                      child: SettingScreen()), // Replace with ProfileScreen
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
      ],
    );
    ref.onDispose(() => router.dispose());
    return router;
  });
}
