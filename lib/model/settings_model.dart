import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_model.freezed.dart';
part 'settings_model.g.dart';

@freezed
class SettingsModel with _$SettingsModel {
  factory SettingsModel({
    String? token,
    String? serverAddress,
    int? port,
    List<String>? category,
    List<String>? method,
    String? rootPath,
  }) = _SettingsState;

  factory SettingsModel.fromJson(Map<String, dynamic> json) => _$SettingsModelFromJson(json);
}
