import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_screen/router.dart';
import 'package:login_screen/screns/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    navigateToScreens();
  }

  void navigateToScreens() async {
    Timer(const Duration(seconds: 2), () async {
      var getSharedPrefData = await SharedPreferences.getInstance();
      String? userExistToken = getSharedPrefData.getString('userToken');
      // getSharedPrefData.remove('userToken');
       if (userExistToken != null ) {
         GoRouter.of(context).go(AppRouter.homeScreen);
       }else{
         GoRouter.of(context).go(AppRouter.loginScreen);
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Make the background color transparent
      body: Stack(
        children: [
          Image.asset(
            'assets/splash.jpg', // Replace with your image path
            fit: BoxFit.cover, // Make the image cover the entire screen
            width: double.infinity, // Make the image width match the screen width
            height: double.infinity, // Make the image height match the screen height
          ),
          const Center(
            child: Text(
              'Flutter First App', // Your label text
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32.0, // Increase font size
                color: Colors.white,

                decorationColor: Colors.orange, // Underline color
                decorationThickness: 2.0, // Underline thickness
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
