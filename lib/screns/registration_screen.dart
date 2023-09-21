import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_screen/provider/user_list_provider.dart';
import 'package:login_screen/screns/components/register_form.dart';

class RegistrationScreen extends ConsumerStatefulWidget {
  const RegistrationScreen({super.key});

  @override
  ConsumerState<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends ConsumerState<RegistrationScreen> {
  TextEditingController uemailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void dispose() {
    super.dispose();

    pwdController.dispose();
    uemailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final loginProvider =  ref.watch(someProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Registration')),
      body: Center(
          child: RegisterForm(
        unameController: uemailController,
        pwdController: pwdController,
        showSnackBar: (message) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content:
                  Text('Enter Email: eve.holt@reqres.in and Password: pistol'),
            ),
          );
        },
        scaffoldMessengerKey: scaffoldMessengerKey,
        registerUser: (uname, pwd) async {
          return await ref
              .read(userListProvider.notifier)
              .registerUser(uname, pwd);
        },
      )),
    );
  }
}
