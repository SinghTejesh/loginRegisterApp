import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:login_screen/provider/user_list_provider.dart';
import 'package:login_screen/router.dart';
import 'package:login_screen/router_const.dart';
import 'package:login_screen/screns/home_page.dart';
import 'package:login_screen/screns/registration_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController unameController = new TextEditingController();
  TextEditingController pwdController = new TextEditingController();

  String _message = '';
  String finalEmail = '';
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    getValidationData().whenComplete(() async {
      Timer(Duration(seconds: 2),
          () => Get.to(finalEmail == null ? RegistrationScreen() : HomePage()));
    });

    super.initState();

    // call the api from here.
    // ref.read(someProvider.notifier).fetchDetails();
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedEmail = sharedPreferences.getString('email');
    setState(() {
      finalEmail = obtainedEmail!;
    });
    print(finalEmail);
  }

  @override
  void dispose() {
    super.dispose();

    unameController.dispose();
    pwdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final loginProvider =  ref.watch(someProvider);

    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, title: Text('Login')),
      body: Container(
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 40, bottom: 20),
                child: Center(
                    child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: unameController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Username',
                     // hintText: 'Enter Email ID',
                      hintText: 'Enter Email eve.holt@reqres.in',
                      icon: Icon(Icons.person_2_outlined),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Username cant be empty';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: pwdController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter Password cityslicka',
                      icon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password can not be empty';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: TextButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        var uname = unameController.text;
                        var pwd = pwdController.text;
                        BuildContext currentContext = context;
                        var getSharedPrefData =
                            await SharedPreferences.getInstance();
                        String? userEmail =
                            getSharedPrefData.getString('email');
                        String? userPass =
                            getSharedPrefData.getString('password');
                        print('userEmail: ${userEmail}');

                        var token = await ref
                            .watch(userListProvider.notifier)
                            .fetchUserLogin(uname, pwd);

                        if (token is AsyncData<String>) {
                          String tokenValue = token.value;

                          final SharedPreferences sharedPreferences =
                              await SharedPreferences.getInstance();
                          sharedPreferences.setString("userToken", tokenValue);

                          Navigator.of(currentContext)
                              .pushNamed(AppRouter.homeScreen);
                        } else {
                          // Handle the case where the result is not as expected
                        }
                        if (uname == userEmail && pwd == userPass) {
                          context.pushNamed(AppRouter.homeScreen);
                        } else {
                          setState(() {
                            _message =
                                'User name : $uname\nPassword: $pwd not correct';
                          });
                        }
                      }
                    },
                    child: Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blue),
                      child: Center(
                          child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      context.pushNamed(AppRouter.registration);
                    },

                    child: Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        //color: Colors.blue
                      ),
                      child: const Center(
                          child: Text(
                        'Registration',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          decorationThickness: 1.0,
                        ),
                      )),
                    ),
                    // child: Text('Registration'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
