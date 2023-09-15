import 'package:flutter/material.dart';
import 'package:login_screen/models/user_data_model.dart';

class UserDataCardWidget extends StatelessWidget {
  final UserDataModel user;

  const UserDataCardWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.blue,
        elevation: 4,
        child: ListTile(
          title: Text(
            user.firstName + " " + user.lastName,
            style: const TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            user.email,
            style: const TextStyle(color: Colors.white),
          ),
          trailing: CircleAvatar(
            backgroundImage: NetworkImage(user.avatar),
          ),
        ),
      ),
    );
  }
}
