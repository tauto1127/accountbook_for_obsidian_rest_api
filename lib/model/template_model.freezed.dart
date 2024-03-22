// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'template_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TemplateModel {
  String get bodyTemplate => throw _privateConstructorUsedError;
  String get titleTemplate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TemplateModelCopyWith<TemplateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemplateModelCopyWith<$Res> {
  factory $TemplateModelCopyWith(
          TemplateModel value, $Res Function(TemplateModel) then) =
      _$TemplateModelCopyWithImpl<$Res, TemplateModel>;
  @useResult
  $Res call({String bodyTemplate, String titleTemplate});
}

/// @nodoc
class _$TemplateModelCopyWithImpl<$Res, $Val extends TemplateModel>
    implements $TemplateModelCopyWith<$Res> {
  _$TemplateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bodyTemplate = null,
    Object? titleTemplate = null,
  }) {
    return _then(_value.copyWith(
      bodyTemplate: null == bodyTemplate
          ? _value.bodyTemplate
          : bodyTemplate // ignore: cast_nullable_to_non_nullable
              as String,
      titleTemplate: null == titleTemplate
          ? _value.titleTemplate
          : titleTemplate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TemplateModelImplCopyWith<$Res>
    implements $TemplateModelCopyWith<$Res> {
  factory _$$TemplateModelImplCopyWith(
          _$TemplateModelImpl value, $Res Function(_$TemplateModelImpl) then) =
      __$$TemplateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String bodyTemplate, String titleTemplate});
}

/// @nodoc
class __$$TemplateModelImplCopyWithImpl<$Res>
    extends _$TemplateModelCopyWithImpl<$Res, _$TemplateModelImpl>
    implements _$$TemplateModelImplCopyWith<$Res> {
  __$$TemplateModelImplCopyWithImpl(
      _$TemplateModelImpl _value, $Res Function(_$TemplateModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bodyTemplate = null,
    Object? titleTemplate = null,
  }) {
    return _then(_$TemplateModelImpl(
      bodyTemplate: null == bodyTemplate
          ? _value.bodyTemplate
          : bodyTemplate // ignore: cast_nullable_to_non_nullable
              as String,
      titleTemplate: null == titleTemplate
          ? _value.titleTemplate
          : titleTemplate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TemplateModelImpl implements _TemplateModel {
  _$TemplateModelImpl(
      {required this.bodyTemplate, required this.titleTemplate});

  @override
  final String bodyTemplate;
  @override
  final String titleTemplate;

  @override
  String toString() {
    return 'TemplateModel(bodyTemplate: $bodyTemplate, titleTemplate: $titleTemplate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TemplateModelImpl &&
            (identical(other.bodyTemplate, bodyTemplate) ||
                other.bodyTemplate == bodyTemplate) &&
            (identical(other.titleTemplate, titleTemplate) ||
                other.titleTemplate == titleTemplate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bodyTemplate, titleTemplate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TemplateModelImplCopyWith<_$TemplateModelImpl> get copyWith =>
      __$$TemplateModelImplCopyWithImpl<_$TemplateModelImpl>(this, _$identity);
}

abstract class _TemplateModel implements TemplateModel {
  factory _TemplateModel(
      {required final String bodyTemplate,
      required final String titleTemplate}) = _$TemplateModelImpl;

  @override
  String get bodyTemplate;
  @override
  String get titleTemplate;
  @override
  @JsonKey(ignore: true)
  _$$TemplateModelImplCopyWith<_$TemplateModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
