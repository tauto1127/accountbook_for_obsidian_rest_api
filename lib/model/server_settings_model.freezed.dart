// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ServerSettingsModel {
  String get serverAddress => throw _privateConstructorUsedError;
  int get port => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  String get rootPath => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ServerSettingsModelCopyWith<ServerSettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerSettingsModelCopyWith<$Res> {
  factory $ServerSettingsModelCopyWith(
          ServerSettingsModel value, $Res Function(ServerSettingsModel) then) =
      _$ServerSettingsModelCopyWithImpl<$Res, ServerSettingsModel>;
  @useResult
  $Res call({String serverAddress, int port, String token, String rootPath});
}

/// @nodoc
class _$ServerSettingsModelCopyWithImpl<$Res, $Val extends ServerSettingsModel>
    implements $ServerSettingsModelCopyWith<$Res> {
  _$ServerSettingsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serverAddress = null,
    Object? port = null,
    Object? token = null,
    Object? rootPath = null,
  }) {
    return _then(_value.copyWith(
      serverAddress: null == serverAddress
          ? _value.serverAddress
          : serverAddress // ignore: cast_nullable_to_non_nullable
              as String,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      rootPath: null == rootPath
          ? _value.rootPath
          : rootPath // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServerSettingsModelImplCopyWith<$Res>
    implements $ServerSettingsModelCopyWith<$Res> {
  factory _$$ServerSettingsModelImplCopyWith(_$ServerSettingsModelImpl value,
          $Res Function(_$ServerSettingsModelImpl) then) =
      __$$ServerSettingsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String serverAddress, int port, String token, String rootPath});
}

/// @nodoc
class __$$ServerSettingsModelImplCopyWithImpl<$Res>
    extends _$ServerSettingsModelCopyWithImpl<$Res, _$ServerSettingsModelImpl>
    implements _$$ServerSettingsModelImplCopyWith<$Res> {
  __$$ServerSettingsModelImplCopyWithImpl(_$ServerSettingsModelImpl _value,
      $Res Function(_$ServerSettingsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serverAddress = null,
    Object? port = null,
    Object? token = null,
    Object? rootPath = null,
  }) {
    return _then(_$ServerSettingsModelImpl(
      serverAddress: null == serverAddress
          ? _value.serverAddress
          : serverAddress // ignore: cast_nullable_to_non_nullable
              as String,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      rootPath: null == rootPath
          ? _value.rootPath
          : rootPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ServerSettingsModelImpl implements _ServerSettingsModel {
  _$ServerSettingsModelImpl(
      {required this.serverAddress,
      required this.port,
      required this.token,
      required this.rootPath});

  @override
  final String serverAddress;
  @override
  final int port;
  @override
  final String token;
  @override
  final String rootPath;

  @override
  String toString() {
    return 'ServerSettingsModel(serverAddress: $serverAddress, port: $port, token: $token, rootPath: $rootPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerSettingsModelImpl &&
            (identical(other.serverAddress, serverAddress) ||
                other.serverAddress == serverAddress) &&
            (identical(other.port, port) || other.port == port) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.rootPath, rootPath) ||
                other.rootPath == rootPath));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, serverAddress, port, token, rootPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerSettingsModelImplCopyWith<_$ServerSettingsModelImpl> get copyWith =>
      __$$ServerSettingsModelImplCopyWithImpl<_$ServerSettingsModelImpl>(
          this, _$identity);
}

abstract class _ServerSettingsModel implements ServerSettingsModel {
  factory _ServerSettingsModel(
      {required final String serverAddress,
      required final int port,
      required final String token,
      required final String rootPath}) = _$ServerSettingsModelImpl;

  @override
  String get serverAddress;
  @override
  int get port;
  @override
  String get token;
  @override
  String get rootPath;
  @override
  @JsonKey(ignore: true)
  _$$ServerSettingsModelImplCopyWith<_$ServerSettingsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
