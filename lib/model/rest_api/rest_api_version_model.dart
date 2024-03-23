import 'package:freezed_annotation/freezed_annotation.dart';

part 'rest_api_version_model.freezed.dart';
part 'rest_api_version_model.g.dart';

@freezed
class RestApiVersionModel with _$RestApiVersionModel {
  factory RestApiVersionModel({
    required String obsidian,
    required String self,
  }) = _RestApiVersionModel;

  factory RestApiVersionModel.fromJson(Map<String, dynamic> json) => _$RestApiVersionModelFromJson(json);
}
