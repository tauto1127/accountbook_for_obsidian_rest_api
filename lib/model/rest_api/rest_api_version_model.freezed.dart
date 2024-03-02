// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rest_api_version_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RestApiVersionModel _$RestApiVersionModelFromJson(Map<String, dynamic> json) {
  return _RestApiVersionModel.fromJson(json);
}

/// @nodoc
mixin _$RestApiVersionModel {
  String get obsidian => throw _privateConstructorUsedError;
  String get self => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RestApiVersionModelCopyWith<RestApiVersionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestApiVersionModelCopyWith<$Res> {
  factory $RestApiVersionModelCopyWith(
          RestApiVersionModel value, $Res Function(RestApiVersionModel) then) =
      _$RestApiVersionModelCopyWithImpl<$Res, RestApiVersionModel>;
  @useResult
  $Res call({String obsidian, String self});
}

/// @nodoc
class _$RestApiVersionModelCopyWithImpl<$Res, $Val extends RestApiVersionModel>
    implements $RestApiVersionModelCopyWith<$Res> {
  _$RestApiVersionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? obsidian = null,
    Object? self = null,
  }) {
    return _then(_value.copyWith(
      obsidian: null == obsidian
          ? _value.obsidian
          : obsidian // ignore: cast_nullable_to_non_nullable
              as String,
      self: null == self
          ? _value.self
          : self // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RestApiVersionModelImplCopyWith<$Res>
    implements $RestApiVersionModelCopyWith<$Res> {
  factory _$$RestApiVersionModelImplCopyWith(_$RestApiVersionModelImpl value,
          $Res Function(_$RestApiVersionModelImpl) then) =
      __$$RestApiVersionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String obsidian, String self});
}

/// @nodoc
class __$$RestApiVersionModelImplCopyWithImpl<$Res>
    extends _$RestApiVersionModelCopyWithImpl<$Res, _$RestApiVersionModelImpl>
    implements _$$RestApiVersionModelImplCopyWith<$Res> {
  __$$RestApiVersionModelImplCopyWithImpl(_$RestApiVersionModelImpl _value,
      $Res Function(_$RestApiVersionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? obsidian = null,
    Object? self = null,
  }) {
    return _then(_$RestApiVersionModelImpl(
      obsidian: null == obsidian
          ? _value.obsidian
          : obsidian // ignore: cast_nullable_to_non_nullable
              as String,
      self: null == self
          ? _value.self
          : self // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestApiVersionModelImpl implements _RestApiVersionModel {
  _$RestApiVersionModelImpl({required this.obsidian, required this.self});

  factory _$RestApiVersionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestApiVersionModelImplFromJson(json);

  @override
  final String obsidian;
  @override
  final String self;

  @override
  String toString() {
    return 'RestApiVersionModel(obsidian: $obsidian, self: $self)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestApiVersionModelImpl &&
            (identical(other.obsidian, obsidian) ||
                other.obsidian == obsidian) &&
            (identical(other.self, self) || other.self == self));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, obsidian, self);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RestApiVersionModelImplCopyWith<_$RestApiVersionModelImpl> get copyWith =>
      __$$RestApiVersionModelImplCopyWithImpl<_$RestApiVersionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestApiVersionModelImplToJson(
      this,
    );
  }
}

abstract class _RestApiVersionModel implements RestApiVersionModel {
  factory _RestApiVersionModel(
      {required final String obsidian,
      required final String self}) = _$RestApiVersionModelImpl;

  factory _RestApiVersionModel.fromJson(Map<String, dynamic> json) =
      _$RestApiVersionModelImpl.fromJson;

  @override
  String get obsidian;
  @override
  String get self;
  @override
  @JsonKey(ignore: true)
  _$$RestApiVersionModelImplCopyWith<_$RestApiVersionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
