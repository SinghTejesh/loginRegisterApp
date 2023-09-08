// import 'dart:convert';
//
// import 'package:dio/dio.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:login_screen/models/user_list_response.dart';
//
// class ApiServices {
//   final String apiUrl = 'https://reqres.in/api/users?page=1'; // Replace with your API URL
//   final Dio _dio = Dio();
//
//   Future<UserListResponse> getUserData() async {
//     final response = await _dio.get(apiUrl);
//     if (response.statusCode == 200) {
//       final jsonData = response.data as Map<String, dynamic>;
//
//       return UserListResponse.fromJson(jsonData);
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }
// }
//
// final userProvider = Provider<ApiServices>((ref)=>ApiServices());
