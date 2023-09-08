import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_screen/models/user_list_response.dart';
import 'package:login_screen/provider/user_list_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState()  {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
       ref.read(userListProvider.notifier).fetchUserDetails();

    });

  }

  @override
  void dispose() {
    super.dispose();

    ref.invalidate(userListProvider);
  }

  @override
  Widget build(BuildContext context) {
//     final AsyncValue<UserListResponse> data = ref.watch(userDataProvider);
    final data = ref.watch(userListProvider);
    print('data1: $data');

    return Scaffold(
      appBar: AppBar(
        title: const Text('User data'),
      ),
      body: data.when(
        data: (userData) {
          // List<UserListResponse> userList = _data.map((e) => e).toList();

          if (userData == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: userData.data.length,
                  itemBuilder: (_, index) {
                    return Card(
                      color: Colors.blue,
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        title: Text(
                          userData.data[index].firstName,
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          userData.data[index].lastName,
                          style: const TextStyle(color: Colors.white),
                        ),
                        trailing: CircleAvatar(
                          backgroundImage:
                              NetworkImage(userData.data[index].avatar),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          );
        },
        error: (err, s) => Text(
          err.toString(),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
