// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SettingsModel _$SettingsModelFromJson(Map<String, dynamic> json) {
  return _SettingsState.fromJson(json);
}

/// @nodoc
mixin _$SettingsModel {
  String? get token => throw _privateConstructorUsedError;
  String? get serverAddress => throw _privateConstructorUsedError;
  int? get port => throw _privateConstructorUsedError;
  List<String>? get category => throw _privateConstructorUsedError;
  List<String>? get method => throw _privateConstructorUsedError;
  String? get rootPath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingsModelCopyWith<SettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsModelCopyWith<$Res> {
  factory $SettingsModelCopyWith(
          SettingsModel value, $Res Function(SettingsModel) then) =
      _$SettingsModelCopyWithImpl<$Res, SettingsModel>;
  @useResult
  $Res call(
      {String? token,
      String? serverAddress,
      int? port,
      List<String>? category,
      List<String>? method,
      String? rootPath});
}

/// @nodoc
class _$SettingsModelCopyWithImpl<$Res, $Val extends SettingsModel>
    implements $SettingsModelCopyWith<$Res> {
  _$SettingsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? serverAddress = freezed,
    Object? port = freezed,
    Object? category = freezed,
    Object? method = freezed,
    Object? rootPath = freezed,
  }) {
    return _then(_value.copyWith(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      serverAddress: freezed == serverAddress
          ? _value.serverAddress
          : serverAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      port: freezed == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      method: freezed == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      rootPath: freezed == rootPath
          ? _value.rootPath
          : rootPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SettingsStateImplCopyWith<$Res>
    implements $SettingsModelCopyWith<$Res> {
  factory _$$SettingsStateImplCopyWith(
          _$SettingsStateImpl value, $Res Function(_$SettingsStateImpl) then) =
      __$$SettingsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? token,
      String? serverAddress,
      int? port,
      List<String>? category,
      List<String>? method,
      String? rootPath});
}

/// @nodoc
class __$$SettingsStateImplCopyWithImpl<$Res>
    extends _$SettingsModelCopyWithImpl<$Res, _$SettingsStateImpl>
    implements _$$SettingsStateImplCopyWith<$Res> {
  __$$SettingsStateImplCopyWithImpl(
      _$SettingsStateImpl _value, $Res Function(_$SettingsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? serverAddress = freezed,
    Object? port = freezed,
    Object? category = freezed,
    Object? method = freezed,
    Object? rootPath = freezed,
  }) {
    return _then(_$SettingsStateImpl(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      serverAddress: freezed == serverAddress
          ? _value.serverAddress
          : serverAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      port: freezed == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int?,
      category: freezed == category
          ? _value._category
          : category // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      method: freezed == method
          ? _value._method
          : method // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      rootPath: freezed == rootPath
          ? _value.rootPath
          : rootPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SettingsStateImpl implements _SettingsState {
  _$SettingsStateImpl(
      {this.token,
      this.serverAddress,
      this.port,
      final List<String>? category,
      final List<String>? method,
      this.rootPath})
      : _category = category,
        _method = method;

  factory _$SettingsStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$SettingsStateImplFromJson(json);

  @override
  final String? token;
  @override
  final String? serverAddress;
  @override
  final int? port;
  final List<String>? _category;
  @override
  List<String>? get category {
    final value = _category;
    if (value == null) return null;
    if (_category is EqualUnmodifiableListView) return _category;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _method;
  @override
  List<String>? get method {
    final value = _method;
    if (value == null) return null;
    if (_method is EqualUnmodifiableListView) return _method;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? rootPath;

  @override
  String toString() {
    return 'SettingsModel(token: $token, serverAddress: $serverAddress, port: $port, category: $category, method: $method, rootPath: $rootPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsStateImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.serverAddress, serverAddress) ||
                other.serverAddress == serverAddress) &&
            (identical(other.port, port) || other.port == port) &&
            const DeepCollectionEquality().equals(other._category, _category) &&
            const DeepCollectionEquality().equals(other._method, _method) &&
            (identical(other.rootPath, rootPath) ||
                other.rootPath == rootPath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      token,
      serverAddress,
      port,
      const DeepCollectionEquality().hash(_category),
      const DeepCollectionEquality().hash(_method),
      rootPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsStateImplCopyWith<_$SettingsStateImpl> get copyWith =>
      __$$SettingsStateImplCopyWithImpl<_$SettingsStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SettingsStateImplToJson(
      this,
    );
  }
}

abstract class _SettingsState implements SettingsModel {
  factory _SettingsState(
      {final String? token,
      final String? serverAddress,
      final int? port,
      final List<String>? category,
      final List<String>? method,
      final String? rootPath}) = _$SettingsStateImpl;

  factory _SettingsState.fromJson(Map<String, dynamic> json) =
      _$SettingsStateImpl.fromJson;

  @override
  String? get token;
  @override
  String? get serverAddress;
  @override
  int? get port;
  @override
  List<String>? get category;
  @override
  List<String>? get method;
  @override
  String? get rootPath;
  @override
  @JsonKey(ignore: true)
  _$$SettingsStateImplCopyWith<_$SettingsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
