import 'package:accountbook_for_obsidian_rest_api/model/rest_api/rest_api_version_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rest_api_status_model.freezed.dart';
part 'rest_api_status_model.g.dart';

@freezed
class RestApiStatusModel with _$RestApiStatusModel {
  factory RestApiStatusModel({
    required String status,
    required RestApiVersionModel versions,
    required String service,
    required bool authenticated,
  }) = _RestApiStatusModel;

  factory RestApiStatusModel.fromJson(Map<String, dynamic> json) => _$RestApiStatusModelFromJson(json);
}
