// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignupStateImpl _$$SignupStateImplFromJson(Map<String, dynamic> json) =>
    _$SignupStateImpl(
      settingsState:
          SettingsState.fromJson(json['settingsState'] as Map<String, dynamic>),
      portHintText: json['portHintText'] as String?,
      hintText: json['hintText'] as String?,
      isChecking: json['isChecking'] as bool? ?? false,
    );

Map<String, dynamic> _$$SignupStateImplToJson(_$SignupStateImpl instance) =>
    <String, dynamic>{
      'settingsState': instance.settingsState,
      'portHintText': instance.portHintText,
      'hintText': instance.hintText,
      'isChecking': instance.isChecking,
    };
