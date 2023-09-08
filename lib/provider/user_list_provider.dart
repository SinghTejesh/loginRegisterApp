import 'package:dio/dio.dart';
import 'package:login_screen/models/user_list_response.dart';
import 'package:login_screen/repository/user_list_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_list_provider.g.dart';

@riverpod
class UserList extends _$UserList {
  @override
  Future<UserListResponse?> build() async {
    return null;
  }

  Future<void> fetchUserDetails() async {
    try {
      final userData = await ref.read(userListRepositoryProvider).getUserData();
      state = AsyncValue.data(userData);
    } on DioException catch (e) {
      print('Error searching User Response due to DIO EXCEPTION: $e');
      state =
          AsyncValue.error('Error searching User Response: $e', StackTrace.current);
    } catch (e) {
      print('Error searching User Response : $e');
      state =
          AsyncValue.error('Error searching products: $e', StackTrace.current);
    }
  }

  Future<AsyncValue<String>> fetchUserLogin(String email, String password) async {
    try {
      final userData = await ref.read(userListRepositoryProvider).loginUser(email, password);
      return AsyncValue.data(userData);
    } on DioException catch (e) {
      print('Error searching User Response due to DIO EXCEPTION: $e');
      return AsyncValue.error('Error searching User Response: $e', StackTrace.current);
    } catch (e) {
      print('Error searching User Response: $e');
      return AsyncValue.error('Error searching products: $e', StackTrace.current);
    }
  }
}
