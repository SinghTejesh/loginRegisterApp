import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_screen/models/user_data_model.dart';
import 'package:login_screen/models/user_list_response.dart';

class UserListRepository {
  final Dio client;

  UserListRepository({required this.client});

  Future<UserListResponse> getUserData() async {

    try {
      final response = await client.get("users?page=1");
      print(response);
      if (response.statusCode == 200) {
        print("Inside DIO Get Data 1");
        final jsonData = response.data as Map<String, dynamic>;
        final result = UserListResponse.fromJson(jsonData);

        print("DIO RESPONSE === ${result.toString()}");
        return result;
      }
      throw Exception('Failed to load data');
    } catch (e) {
      print("catch block rethrow $e ");
      rethrow;
    }
  }

  Future<String> loginUser(String email, String password) async {

    try {
      final response = await client.post(
        "login",
        data: {
          "email": email,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
        final jsonData = response.data as Map<String, dynamic>;
        final token = jsonData['token'] as String;
        print(token);
        return token;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print("catch block rethrow $e");
      rethrow;
    }
  }

  List<UserDataModel> getFilteredData(String searchTerm, List<UserDataModel> users) {
    final filteredUserData = users.where((user) {
      final fullName = '${user.firstName} ${user.lastName}'.toLowerCase();
      return fullName.contains(searchTerm);
    }).toList();
    return filteredUserData;
  }



}
