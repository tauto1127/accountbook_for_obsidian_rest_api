// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rest_api_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RestApiStatusModel _$RestApiStatusModelFromJson(Map<String, dynamic> json) {
  return _RestApiStatusModel.fromJson(json);
}

/// @nodoc
mixin _$RestApiStatusModel {
  String get status => throw _privateConstructorUsedError;
  RestApiVersionModel get versions => throw _privateConstructorUsedError;
  String get service => throw _privateConstructorUsedError;
  bool get authenticated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RestApiStatusModelCopyWith<RestApiStatusModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestApiStatusModelCopyWith<$Res> {
  factory $RestApiStatusModelCopyWith(
          RestApiStatusModel value, $Res Function(RestApiStatusModel) then) =
      _$RestApiStatusModelCopyWithImpl<$Res, RestApiStatusModel>;
  @useResult
  $Res call(
      {String status,
      RestApiVersionModel versions,
      String service,
      bool authenticated});

  $RestApiVersionModelCopyWith<$Res> get versions;
}

/// @nodoc
class _$RestApiStatusModelCopyWithImpl<$Res, $Val extends RestApiStatusModel>
    implements $RestApiStatusModelCopyWith<$Res> {
  _$RestApiStatusModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? versions = null,
    Object? service = null,
    Object? authenticated = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      versions: null == versions
          ? _value.versions
          : versions // ignore: cast_nullable_to_non_nullable
              as RestApiVersionModel,
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String,
      authenticated: null == authenticated
          ? _value.authenticated
          : authenticated // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RestApiVersionModelCopyWith<$Res> get versions {
    return $RestApiVersionModelCopyWith<$Res>(_value.versions, (value) {
      return _then(_value.copyWith(versions: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RestApiStatusModelImplCopyWith<$Res>
    implements $RestApiStatusModelCopyWith<$Res> {
  factory _$$RestApiStatusModelImplCopyWith(_$RestApiStatusModelImpl value,
          $Res Function(_$RestApiStatusModelImpl) then) =
      __$$RestApiStatusModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status,
      RestApiVersionModel versions,
      String service,
      bool authenticated});

  @override
  $RestApiVersionModelCopyWith<$Res> get versions;
}

/// @nodoc
class __$$RestApiStatusModelImplCopyWithImpl<$Res>
    extends _$RestApiStatusModelCopyWithImpl<$Res, _$RestApiStatusModelImpl>
    implements _$$RestApiStatusModelImplCopyWith<$Res> {
  __$$RestApiStatusModelImplCopyWithImpl(_$RestApiStatusModelImpl _value,
      $Res Function(_$RestApiStatusModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? versions = null,
    Object? service = null,
    Object? authenticated = null,
  }) {
    return _then(_$RestApiStatusModelImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      versions: null == versions
          ? _value.versions
          : versions // ignore: cast_nullable_to_non_nullable
              as RestApiVersionModel,
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String,
      authenticated: null == authenticated
          ? _value.authenticated
          : authenticated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestApiStatusModelImpl implements _RestApiStatusModel {
  _$RestApiStatusModelImpl(
      {required this.status,
      required this.versions,
      required this.service,
      required this.authenticated});

  factory _$RestApiStatusModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestApiStatusModelImplFromJson(json);

  @override
  final String status;
  @override
  final RestApiVersionModel versions;
  @override
  final String service;
  @override
  final bool authenticated;

  @override
  String toString() {
    return 'RestApiStatusModel(status: $status, versions: $versions, service: $service, authenticated: $authenticated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestApiStatusModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.versions, versions) ||
                other.versions == versions) &&
            (identical(other.service, service) || other.service == service) &&
            (identical(other.authenticated, authenticated) ||
                other.authenticated == authenticated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, versions, service, authenticated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RestApiStatusModelImplCopyWith<_$RestApiStatusModelImpl> get copyWith =>
      __$$RestApiStatusModelImplCopyWithImpl<_$RestApiStatusModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestApiStatusModelImplToJson(
      this,
    );
  }
}

abstract class _RestApiStatusModel implements RestApiStatusModel {
  factory _RestApiStatusModel(
      {required final String status,
      required final RestApiVersionModel versions,
      required final String service,
      required final bool authenticated}) = _$RestApiStatusModelImpl;

  factory _RestApiStatusModel.fromJson(Map<String, dynamic> json) =
      _$RestApiStatusModelImpl.fromJson;

  @override
  String get status;
  @override
  RestApiVersionModel get versions;
  @override
  String get service;
  @override
  bool get authenticated;
  @override
  @JsonKey(ignore: true)
  _$$RestApiStatusModelImplCopyWith<_$RestApiStatusModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
