import 'package:go_router/go_router.dart';
import 'package:login_screen/screns/home_page.dart';
import 'package:login_screen/screns/login_screen.dart';
import 'package:login_screen/screns/registration_screen.dart';
import 'package:login_screen/screns/splash_screen.dart';

class AppRouter {
  static const String splashScreen = '/';
  static const String loginScreen = '/loginScreen';
  static const String registration = '/registration';
  static const String homeScreen = '/homeScreen';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: splashScreen,
        path: splashScreen,
        builder: (context, state) {
          return SplashScreen();
        },
      ),

       GoRoute(
        name: registration,
        path: registration,
        builder: (context, state) {
          return const RegistrationScreen();
        },
      ),

      GoRoute(
        name: loginScreen,
        path: loginScreen,
        builder: (context, state) {
          return const LoginScreen();
        },
      ),

      GoRoute(
        name: homeScreen,
        path: homeScreen,
        builder: (context, state) {
          return const HomePage();
        },
      ),

    ],
  );
}
