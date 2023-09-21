import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_screen/provider/user_list_provider.dart';
import 'package:login_screen/router.dart';
import 'package:login_screen/screns/components/login_form_methods.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginForm extends StatefulWidget {
  final TextEditingController unameController;
  final TextEditingController pwdController;
  final Function(String message) showSnackBar;

  final Future<AsyncValue<String>> Function(String, String) fetchUserLogin;

  const LoginForm({
    Key? key,
    required this.unameController,
    required this.pwdController,
    required this.showSnackBar,
    required this.fetchUserLogin,
  }) : super(key: key);

  @override
  createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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
                'Login',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: widget.unameController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Username',
                hintText: 'Enter Email eve.holt@reqres.in',
                icon: const Icon(Icons.person_2_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
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
                hintText: 'Enter Password cityslicka',
                icon: const Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Password cannot be empty';
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
                    var token = await widget.fetchUserLogin(uname, pwd);
                    var container = ProviderContainer();
                    if (mounted) {
                      processToken(container, context, token, () {
                        widget.showSnackBar(
                            "Enter Email: eve.holt@reqres.in and Password: pistol");
                      });
                    }
                  }
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: const BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ), // Border color and width
                    ),
                  ),
                ),
                child: const SizedBox(
                  width: 200,
                  height: 40,
                  child: Center(
                    child: Text(
                      'Sign In',
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

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: TextButton(
                onPressed: () async {
                  GoRouter.of(context).go(AppRouter.registration);
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: const BorderSide(
                          color: Colors.blue,
                          width: 2), // Border color and width
                    ),
                  ),
                ),
                child: const SizedBox(
                  width: 200,
                  height: 40,
                  child: Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // ... Other UI components ...
        ],
      ),
    );
  }
}
