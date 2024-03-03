// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SignupState _$SignupStateFromJson(Map<String, dynamic> json) {
  return _SignupState.fromJson(json);
}

/// @nodoc
mixin _$SignupState {
  SettingsState get settingsState => throw _privateConstructorUsedError;
  String? get portHintText => throw _privateConstructorUsedError;
  String? get hintText => throw _privateConstructorUsedError;
  bool get isChecking => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignupStateCopyWith<SignupState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupStateCopyWith<$Res> {
  factory $SignupStateCopyWith(
          SignupState value, $Res Function(SignupState) then) =
      _$SignupStateCopyWithImpl<$Res, SignupState>;
  @useResult
  $Res call(
      {SettingsState settingsState,
      String? portHintText,
      String? hintText,
      bool isChecking});

  $SettingsStateCopyWith<$Res> get settingsState;
}

/// @nodoc
class _$SignupStateCopyWithImpl<$Res, $Val extends SignupState>
    implements $SignupStateCopyWith<$Res> {
  _$SignupStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? settingsState = null,
    Object? portHintText = freezed,
    Object? hintText = freezed,
    Object? isChecking = null,
  }) {
    return _then(_value.copyWith(
      settingsState: null == settingsState
          ? _value.settingsState
          : settingsState // ignore: cast_nullable_to_non_nullable
              as SettingsState,
      portHintText: freezed == portHintText
          ? _value.portHintText
          : portHintText // ignore: cast_nullable_to_non_nullable
              as String?,
      hintText: freezed == hintText
          ? _value.hintText
          : hintText // ignore: cast_nullable_to_non_nullable
              as String?,
      isChecking: null == isChecking
          ? _value.isChecking
          : isChecking // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SettingsStateCopyWith<$Res> get settingsState {
    return $SettingsStateCopyWith<$Res>(_value.settingsState, (value) {
      return _then(_value.copyWith(settingsState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SignupStateImplCopyWith<$Res>
    implements $SignupStateCopyWith<$Res> {
  factory _$$SignupStateImplCopyWith(
          _$SignupStateImpl value, $Res Function(_$SignupStateImpl) then) =
      __$$SignupStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SettingsState settingsState,
      String? portHintText,
      String? hintText,
      bool isChecking});

  @override
  $SettingsStateCopyWith<$Res> get settingsState;
}

/// @nodoc
class __$$SignupStateImplCopyWithImpl<$Res>
    extends _$SignupStateCopyWithImpl<$Res, _$SignupStateImpl>
    implements _$$SignupStateImplCopyWith<$Res> {
  __$$SignupStateImplCopyWithImpl(
      _$SignupStateImpl _value, $Res Function(_$SignupStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? settingsState = null,
    Object? portHintText = freezed,
    Object? hintText = freezed,
    Object? isChecking = null,
  }) {
    return _then(_$SignupStateImpl(
      settingsState: null == settingsState
          ? _value.settingsState
          : settingsState // ignore: cast_nullable_to_non_nullable
              as SettingsState,
      portHintText: freezed == portHintText
          ? _value.portHintText
          : portHintText // ignore: cast_nullable_to_non_nullable
              as String?,
      hintText: freezed == hintText
          ? _value.hintText
          : hintText // ignore: cast_nullable_to_non_nullable
              as String?,
      isChecking: null == isChecking
          ? _value.isChecking
          : isChecking // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignupStateImpl implements _SignupState {
  _$SignupStateImpl(
      {required this.settingsState,
      this.portHintText,
      this.hintText,
      this.isChecking = false});

  factory _$SignupStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignupStateImplFromJson(json);

  @override
  final SettingsState settingsState;
  @override
  final String? portHintText;
  @override
  final String? hintText;
  @override
  @JsonKey()
  final bool isChecking;

  @override
  String toString() {
    return 'SignupState(settingsState: $settingsState, portHintText: $portHintText, hintText: $hintText, isChecking: $isChecking)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignupStateImpl &&
            (identical(other.settingsState, settingsState) ||
                other.settingsState == settingsState) &&
            (identical(other.portHintText, portHintText) ||
                other.portHintText == portHintText) &&
            (identical(other.hintText, hintText) ||
                other.hintText == hintText) &&
            (identical(other.isChecking, isChecking) ||
                other.isChecking == isChecking));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, settingsState, portHintText, hintText, isChecking);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignupStateImplCopyWith<_$SignupStateImpl> get copyWith =>
      __$$SignupStateImplCopyWithImpl<_$SignupStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignupStateImplToJson(
      this,
    );
  }
}

abstract class _SignupState implements SignupState {
  factory _SignupState(
      {required final SettingsState settingsState,
      final String? portHintText,
      final String? hintText,
      final bool isChecking}) = _$SignupStateImpl;

  factory _SignupState.fromJson(Map<String, dynamic> json) =
      _$SignupStateImpl.fromJson;

  @override
  SettingsState get settingsState;
  @override
  String? get portHintText;
  @override
  String? get hintText;
  @override
  bool get isChecking;
  @override
  @JsonKey(ignore: true)
  _$$SignupStateImplCopyWith<_$SignupStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
