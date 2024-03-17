import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_model.freezed.dart';
part 'settings_model.g.dart';

@freezed
class SettingsState with _$SettingsState {
  factory SettingsState({
    String? token,
    String? serverAddress,
    int? port,
    List<String>? category,
    List<String>? method,
    String? rootPath,
  }) = _SettingsState;

  factory SettingsState.fromJson(Map<String, dynamic> json) =>
      _$SettingsStateFromJson(json);
}
