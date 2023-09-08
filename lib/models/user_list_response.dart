import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:login_screen/models/user_data_model.dart';

part 'user_list_response.freezed.dart';
part 'user_list_response.g.dart';

@freezed
class UserListResponse with _$UserListResponse {
  const factory UserListResponse({
    required int page,
    required int perPage,
    required int total,
    required int totalPages,
    required List<UserDataModel> data,
  }) = _UserListResponse;



  factory UserListResponse.fromJson(Map<String, dynamic> json) =>
      _$UserListResponseFromJson(json);
}