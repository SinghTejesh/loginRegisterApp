// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:login_screen/scaffold_with_nested_navigation.dart';
// import 'package:login_screen/screns/home_page.dart';
// import 'package:login_screen/screns/login_screen.dart';
// import 'package:login_screen/screns/profile_screen.dart';
// import 'package:login_screen/screns/registration_screen.dart';
// import 'package:login_screen/screns/setting_screen.dart';
// import 'package:login_screen/screns/splash_screen.dart';
//
// class NavigationBottomRouter {
//   static const String homeScreen = '/homeScreen';
//   static const  String profileScreen = ProfileScreen.profileScreenPath;
//   static const String settingsScreen = '/settingScreen';
//
//   static final GlobalKey<NavigatorState> _shellNavigatorAKey =
//   GlobalKey<NavigatorState>();
//
//   static final GoRouter router = GoRouter(
//     routes: [
//       StatefulShellRoute.indexedStack(
//         builder: (context, state, navigationShell) {
//           return ScaffoldWithNestedNavigation(
//               navigationShell: navigationShell);
//         },
//         branches: [
//           StatefulShellBranch(
//             navigatorKey: _shellNavigatorAKey,
//             routes: [
//               // top route inside branch
//               GoRoute(
//                 path: homeScreen,
//                 pageBuilder: (context, state) =>
//                 const MaterialPage(child: HomePage()), // Replace with ProfileScreen
//               ),
//               // Define the route for the profile screen
//               GoRoute(
//                 path: homeScreen,
//                 pageBuilder: (context, state) =>
//                 const MaterialPage(child: HomePage()), // Replace with HomePage
//               ),
//               // Define the route for the settings screen
//               GoRoute(
//                 path: settingsScreen,
//                 pageBuilder: (context, state) =>
//                   MaterialPage(child: SettingScreen()), // Replace with ProfileScreen
//               ),
//             ],
//           ),
//         ],
//       ),
//     ],
//   );
// }
