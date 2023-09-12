import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_screen/models/user_data_model.dart';
import 'package:login_screen/models/user_list_response.dart';
import 'package:login_screen/provider/user_list_provider.dart';


class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _HomePageState();
}



class _HomePageState extends ConsumerState<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  List<UserDataModel> filteredUserData = [];

  @override
  void initState()  {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
       ref.read(userListProvider.notifier).fetchUserDetails();


    });

    _searchController.addListener(() {
      filterUserList();
    });

  }


  void filterUserList() {

    final searchTerm = _searchController.text.toLowerCase();

    // Use the searchTerm to filter the user data.
    final userDataProvider = ref.watch(userListProvider);
    print(userDataProvider);
    if (userDataProvider is AsyncData<UserListResponse?>) {
      if (userDataProvider.value != null) {
        final userListResponse = userDataProvider.value!;
        final userList = userListResponse.data;
        final userData = ref.read(userListProvider.notifier).getFilteredUserData(searchTerm, userList);
        print(userData);
        filteredUserData = userData;

        // Now, userList contains the list of UserDataModel
      }
    }


    // if (userData is AsyncData<UserListResponse?>) {
    //   if (userData.value != null) {
    //     setState(() {
    //       filteredUserData = userData.value!.data.where((user) {
    //         final fullName = '${user.firstName} ${user.lastName}'.toLowerCase();
    //         return fullName.contains(searchTerm);
    //       }).toList();
    //
    //     });
    //   }
    // }
  }


  @override
  void dispose() {
    super.dispose();
    ref.invalidate(userListProvider);
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
//     final AsyncValue<UserListResponse> data = ref.watch(userDataProvider);
    final data = ref.watch(userListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('User data'),
      ),
      body: data.when(
        data: (userData) {
          // List<UserListResponse> userList = _data.map((e) => e).toList();

          if (userData == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  labelText: 'Search',
                  suffixIcon: Icon(Icons.search),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredUserData.isEmpty ? userData.data.length : filteredUserData.length,
                  itemBuilder: (_, index) {
                    final user = filteredUserData.isEmpty ? userData.data[index] : filteredUserData[index];
                    return Card(
                      color: Colors.blue,
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        title: Text(
                          user.firstName,
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                         user.lastName,
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
