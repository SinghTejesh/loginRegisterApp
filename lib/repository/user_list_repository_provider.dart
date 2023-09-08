import 'package:login_screen/di/dio_client.dart';
import 'package:login_screen/repository/user_list_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

 part 'user_list_repository_provider.g.dart';


@riverpod
UserListRepository userListRepository(UserListRepositoryRef ref) =>
    UserListRepository(
      client: ref.watch(dioProvider), // the provider we defined above
    );
