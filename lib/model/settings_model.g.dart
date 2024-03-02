// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SettingsStateImpl _$$SettingsStateImplFromJson(Map<String, dynamic> json) =>
    _$SettingsStateImpl(
      token: json['token'] as String?,
      serverAddress: json['serverAddress'] as String?,
      port: json['port'] as int?,
    );

Map<String, dynamic> _$$SettingsStateImplToJson(_$SettingsStateImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'serverAddress': instance.serverAddress,
      'port': instance.port,
    };
