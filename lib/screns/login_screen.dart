import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:login_screen/provider/user_list_provider.dart';
import 'package:login_screen/router.dart';
import 'package:login_screen/screns/components/login_form.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController unameController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    unameController.dispose();
    pwdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(AppRouter().goRouterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: LoginForm(
          unameController: unameController,
          pwdController: pwdController,
          //formKey: formKey,
          showSnackBar: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
              ),
            );
          },
          fetchUserLogin: (uname, pwd) async {
            return await ref
                .read(userListProvider.notifier)
                .fetchUserLogin(uname, pwd);
          },
        ),
      ),
    );
  }
}
