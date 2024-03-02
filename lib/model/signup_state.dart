import 'package:accountbook_for_obsidian_rest_api/model/settings_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.freezed.dart';
part 'signup_state.g.dart';

@freezed
class SignupState with _$SignupState {
  factory SignupState(
      {required SettingsState settingsState,
      String? portHintText,
      String? hintText}) = _SignupState;

  factory SignupState.fromJson(Map<String, dynamic> json) =>
      _$SignupStateFromJson(json);
}
