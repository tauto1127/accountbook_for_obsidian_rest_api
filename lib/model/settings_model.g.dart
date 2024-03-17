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
      category: (json['category'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      method:
          (json['method'] as List<dynamic>?)?.map((e) => e as String).toList(),
      rootPath: json['rootPath'] as String?,
    );

Map<String, dynamic> _$$SettingsStateImplToJson(_$SettingsStateImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'serverAddress': instance.serverAddress,
      'port': instance.port,
      'category': instance.category,
      'method': instance.method,
      'rootPath': instance.rootPath,
    };
