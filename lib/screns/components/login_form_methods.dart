import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_screen/router.dart';
import 'package:shared_preferences/shared_preferences.dart';


void processToken(token, Function showSnackBar) async {
  if (token != null) {
    if (token is AsyncData<String>) {
      String tokenValue = token.value;
      final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
      await sharedPreferences.setString("userToken", tokenValue);
      AppRouter.router.go(AppRouter.homeScreen);

    } else {
      showSnackBar();
    }
  } else {
    showSnackBar();
  }
}




