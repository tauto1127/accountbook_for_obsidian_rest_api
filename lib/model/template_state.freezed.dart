// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'template_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TemplateState {
  String? get errorText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TemplateStateCopyWith<TemplateState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemplateStateCopyWith<$Res> {
  factory $TemplateStateCopyWith(
          TemplateState value, $Res Function(TemplateState) then) =
      _$TemplateStateCopyWithImpl<$Res, TemplateState>;
  @useResult
  $Res call({String? errorText});
}

/// @nodoc
class _$TemplateStateCopyWithImpl<$Res, $Val extends TemplateState>
    implements $TemplateStateCopyWith<$Res> {
  _$TemplateStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorText = freezed,
  }) {
    return _then(_value.copyWith(
      errorText: freezed == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TemplateStateImplCopyWith<$Res>
    implements $TemplateStateCopyWith<$Res> {
  factory _$$TemplateStateImplCopyWith(
          _$TemplateStateImpl value, $Res Function(_$TemplateStateImpl) then) =
      __$$TemplateStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? errorText});
}

/// @nodoc
class __$$TemplateStateImplCopyWithImpl<$Res>
    extends _$TemplateStateCopyWithImpl<$Res, _$TemplateStateImpl>
    implements _$$TemplateStateImplCopyWith<$Res> {
  __$$TemplateStateImplCopyWithImpl(
      _$TemplateStateImpl _value, $Res Function(_$TemplateStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorText = freezed,
  }) {
    return _then(_$TemplateStateImpl(
      errorText: freezed == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$TemplateStateImpl implements _TemplateState {
  _$TemplateStateImpl({this.errorText});

  @override
  final String? errorText;

  @override
  String toString() {
    return 'TemplateState(errorText: $errorText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TemplateStateImpl &&
            (identical(other.errorText, errorText) ||
                other.errorText == errorText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TemplateStateImplCopyWith<_$TemplateStateImpl> get copyWith =>
      __$$TemplateStateImplCopyWithImpl<_$TemplateStateImpl>(this, _$identity);
}

abstract class _TemplateState implements TemplateState {
  factory _TemplateState({final String? errorText}) = _$TemplateStateImpl;

  @override
  String? get errorText;
  @override
  @JsonKey(ignore: true)
  _$$TemplateStateImplCopyWith<_$TemplateStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
