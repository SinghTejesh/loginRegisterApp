import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_screen/models/user_data_model.dart';
import 'package:login_screen/provider/search_query_provider.dart';
import 'package:login_screen/provider/user_list_provider.dart';
import 'package:login_screen/router.dart';
import 'package:login_screen/screns/components/searchbox_widget.dart';
import 'package:login_screen/screns/components/user_data_card_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(userListProvider.notifier).fetchUserDetails();
    });

    _searchController.addListener(() {
      ref.read(searchQueryProvider.notifier).state =
          _searchController.text.trim().toLowerCase();
    });
  }

  void _handleLogout(BuildContext context) async {
    var getSharedPrefData = await SharedPreferences.getInstance();
    await getSharedPrefData.remove('userToken');
    AppRouter.router.go(AppRouter.loginScreen); // Replace '/login' with your actual login route
  }

  @override
  void dispose() {
    super.dispose();
    ref.invalidate(userListProvider);
    ref.invalidate(searchQueryProvider);
    _searchController.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _handleLogout(context),
          ),
        ],
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final data = ref.watch(userListProvider);
          final searchQuery = ref.watch(searchQueryProvider);

          return data.when(
            data: (data) {
              if (data == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (data.data.isEmpty) {
                return const Center(
                  child: Text("No records found!"),
                );
              }

              final List<UserDataModel> userData = data.data;

              final filteredUsers = userData.where((user) {
                if (searchQuery.isNotEmpty &&
                    !(user.firstName.toLowerCase().startsWith(searchQuery) ||
                        user.lastName.toLowerCase().startsWith(searchQuery))) {
                  return false; // Skip users that don't match the search query
                }

                return true;
              }).toList();

              return Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  SearchBox(
                      controller: _searchController, hint: "Search Here..."),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: filteredUsers.length,
                      itemBuilder: (_, index) {
                        final UserDataModel user = filteredUsers[index];
                        return UserDataCardWidget(
                          user: user,
                        );
                      },
                    ),
                  )
                ],
              );
            },
            error: (err, s) => Center(
              child: Text(
                err.toString(),
              ),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
