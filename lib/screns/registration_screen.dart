import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_screen/router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController uemailController = new TextEditingController();
  TextEditingController unameController = new TextEditingController();
  TextEditingController pwdController = new TextEditingController();

  String _message = '';
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();

    unameController.dispose();
    pwdController.dispose();
    uemailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final loginProvider =  ref.watch(someProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Registration')),
      body: Container(
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 20),
                child: Center(
                    child: Text(
                  'Registration',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey),
                )),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: unameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Username',
                      hintText: 'Enter Username',
                      icon: Icon(Icons.person_2_rounded),
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
                  controller: uemailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter Email ID',
                      icon: Icon(Icons.email_rounded),
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
                      hintText: 'Enter Password',
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
                     // context.pushNamed(AppRouter.loginScreen);
                      var userEmail = uemailController.text;
                      var userPwd = pwdController.text;
                      final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                      sharedPreferences.setString("email", userEmail);
                      sharedPreferences.setString("password", userPwd);



                      if (userEmail.isEmpty || userPwd.isEmpty ) {
                        // Show a SnackBar to inform the user that fields cannot be empty
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please fill in all fields.'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    child: Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blue),
                      child: const Center(
                          child: Text(
                        'Register',
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
                child: Text(_message),
              )
            ],
          ),
        ),
      ),
    );
  }
}
