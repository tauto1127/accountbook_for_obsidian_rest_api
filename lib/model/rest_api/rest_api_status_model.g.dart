// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_api_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RestApiStatusModelImpl _$$RestApiStatusModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RestApiStatusModelImpl(
      status: json['status'] as String,
      versions: RestApiVersionModel.fromJson(
          json['versions'] as Map<String, dynamic>),
      service: json['service'] as String,
      authenticated: json['authenticated'] as bool,
    );

Map<String, dynamic> _$$RestApiStatusModelImplToJson(
        _$RestApiStatusModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'versions': instance.versions,
      'service': instance.service,
      'authenticated': instance.authenticated,
    };
