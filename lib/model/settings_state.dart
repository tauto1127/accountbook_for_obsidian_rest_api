import 'package:accountbook_for_obsidian_rest_api/model/server_settings_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.freezed.dart';

@freezed
class SettingsState with _$SettingsState {

  factory SettingsState({
    required ServerSettingsModel setting,
    @Default(false)bool isLoading,
  }) = _SettingsState;
  
}