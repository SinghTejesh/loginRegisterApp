import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_screen/models/user_data_model.dart';
import 'package:login_screen/models/user_list_response.dart';
import 'package:login_screen/provider/user_list_provider.dart';
import 'package:login_screen/provider/user_search_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  List<UserDataModel> filteredUserData = [];
  @override
  void initState() {
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
    final userDataProvider = ref.watch(userListProvider);
    final userData = userDataProvider.maybeWhen(
      data: (userData) => userData,
      orElse: () => null,
    );
    if (userData != null) {
      final userListResponse = userData;
      final userList = userListResponse.data;
       filteredUserData = ref
          .read(userListProvider.notifier)
          .getFilteredUserData(searchTerm, userList);
      ref.read(filteredUserListProvider.notifier).state = filteredUserData;
    }
  }

  @override
  void dispose() {
    super.dispose();
    ref.invalidate(userListProvider);
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(userListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('User data'),
      ),
      body: data.when(
        data: (userData) {
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
                child: Consumer(
                  builder: (context, watch, child) {
                  ref.watch(filteredUserListProvider);
                    return ListView.builder(
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
                              backgroundImage: NetworkImage(user.avatar),
                            ),
                          ),
                        );
                      },
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
