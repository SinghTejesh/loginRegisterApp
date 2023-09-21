import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_screen/router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatelessWidget {

  const ProfileScreen({Key? key}) : super(key: key);

  void _handleLogout(BuildContext context) async {
    var getSharedPrefData = await SharedPreferences.getInstance();
    await getSharedPrefData.remove('userToken');
    //GoRouter.of(context).go(AppRouter.loginScreen);
    GoRouter.of(context).go(AppRouter.loginScreen);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _handleLogout(context),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'WELCOME JOE', // Replace with the user's name
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'johndoe@example.com', // Replace with the user's email
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Add logic for editing the profile here
              },
              child: const Text('Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
