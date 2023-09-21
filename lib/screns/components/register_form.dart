import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_screen/router.dart';
import 'package:login_screen/screns/components/login_form_methods.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterForm extends StatefulWidget {
  final TextEditingController unameController;
  final TextEditingController pwdController;
  final Function(String message) showSnackBar;
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;
  final Future<AsyncValue<String>> Function(String, String) registerUser;

  const RegisterForm({
    Key? key,
    required this.unameController,
    required this.pwdController,
    required this.showSnackBar,
    required this.scaffoldMessengerKey,
    required this.registerUser,
  }) : super(key: key);

  @override
   createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 40, bottom: 20),
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
              controller: widget.unameController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter Email ID',
                  icon: const Icon(Icons.email_rounded),
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
              controller: widget.pwdController,
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
                  if (_formKey.currentState!.validate()) {
                    var uname = widget.unameController.text;
                    var pwd = widget.pwdController.text;
                    var token = await widget.registerUser(uname, pwd);
                    var container = ProviderContainer();
                    processToken(container,context,token, (){
                      widget.showSnackBar("Enter Email: eve.holt@reqres.in and Password:pistol");
                    });
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
                        'Sign Up',
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
                onPressed: () async {
                  GoRouter.of(context).go(AppRouter.loginScreen);
                },

                child: const SizedBox(
                  width: 300,
                  height: 40,
                  child: Center(
                    child: Text(
                      'Already have account? Sign In',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),


          // Padding(
          //
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(_message),
          // )
        ],
      ),
    );
  }
}
