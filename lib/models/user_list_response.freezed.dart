// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserListResponse _$UserListResponseFromJson(Map<String, dynamic> json) {
  return _UserListResponse.fromJson(json);
}

/// @nodoc
mixin _$UserListResponse {
  int get page => throw _privateConstructorUsedError;
  int get perPage => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  List<UserDataModel> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserListResponseCopyWith<UserListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserListResponseCopyWith<$Res> {
  factory $UserListResponseCopyWith(
          UserListResponse value, $Res Function(UserListResponse) then) =
      _$UserListResponseCopyWithImpl<$Res, UserListResponse>;
  @useResult
  $Res call(
      {int page,
      int perPage,
      int total,
      int totalPages,
      List<UserDataModel> data});
}

/// @nodoc
class _$UserListResponseCopyWithImpl<$Res, $Val extends UserListResponse>
    implements $UserListResponseCopyWith<$Res> {
  _$UserListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? perPage = null,
    Object? total = null,
    Object? totalPages = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<UserDataModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserListResponseCopyWith<$Res>
    implements $UserListResponseCopyWith<$Res> {
  factory _$$_UserListResponseCopyWith(
          _$_UserListResponse value, $Res Function(_$_UserListResponse) then) =
      __$$_UserListResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int page,
      int perPage,
      int total,
      int totalPages,
      List<UserDataModel> data});
}

/// @nodoc
class __$$_UserListResponseCopyWithImpl<$Res>
    extends _$UserListResponseCopyWithImpl<$Res, _$_UserListResponse>
    implements _$$_UserListResponseCopyWith<$Res> {
  __$$_UserListResponseCopyWithImpl(
      _$_UserListResponse _value, $Res Function(_$_UserListResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? perPage = null,
    Object? total = null,
    Object? totalPages = null,
    Object? data = null,
  }) {
    return _then(_$_UserListResponse(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<UserDataModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserListResponse
    with DiagnosticableTreeMixin
    implements _UserListResponse {
  const _$_UserListResponse(
      {required this.page,
      required this.perPage,
      required this.total,
      required this.totalPages,
      required final List<UserDataModel> data})
      : _data = data;

  factory _$_UserListResponse.fromJson(Map<String, dynamic> json) =>
      _$$_UserListResponseFromJson(json);

  @override
  final int page;
  @override
  final int perPage;
  @override
  final int total;
  @override
  final int totalPages;
  final List<UserDataModel> _data;
  @override
  List<UserDataModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserListResponse(page: $page, perPage: $perPage, total: $total, totalPages: $totalPages, data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserListResponse'))
      ..add(DiagnosticsProperty('page', page))
      ..add(DiagnosticsProperty('perPage', perPage))
      ..add(DiagnosticsProperty('total', total))
      ..add(DiagnosticsProperty('totalPages', totalPages))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserListResponse &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, page, perPage, total, totalPages,
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserListResponseCopyWith<_$_UserListResponse> get copyWith =>
      __$$_UserListResponseCopyWithImpl<_$_UserListResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserListResponseToJson(
      this,
    );
  }
}

abstract class _UserListResponse implements UserListResponse {
  const factory _UserListResponse(
      {required final int page,
      required final int perPage,
      required final int total,
      required final int totalPages,
      required final List<UserDataModel> data}) = _$_UserListResponse;

  factory _UserListResponse.fromJson(Map<String, dynamic> json) =
      _$_UserListResponse.fromJson;

  @override
  int get page;
  @override
  int get perPage;
  @override
  int get total;
  @override
  int get totalPages;
  @override
  List<UserDataModel> get data;
  @override
  @JsonKey(ignore: true)
  _$$_UserListResponseCopyWith<_$_UserListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
