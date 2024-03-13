import 'package:accountbook_for_obsidian_rest_api/const/default_value.dart';
import 'package:accountbook_for_obsidian_rest_api/const/shared_preferences_field_nae.dart';
import 'package:accountbook_for_obsidian_rest_api/model/settings_model.dart';
import 'package:accountbook_for_obsidian_rest_api/model/signup_state.dart';
import 'package:accountbook_for_obsidian_rest_api/view_model/settings_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final signupViewModelProvider =
    StateNotifierProvider.autoDispose<SignupViewModel, SignupState>((ref) =>
        SignupViewModel(
            SignupState(settingsState: ref.watch(settingsViewModelProvider)),
            ref));

class SignupViewModel extends StateNotifier<SignupState> {
  AutoDisposeStateNotifierProviderRef ref;
  SignupViewModel(SignupState state, this.ref) : super(state);

  //ここのstateが変わっても，再ビルドはされない
  TextEditingController serverAddressController = TextEditingController();
  TextEditingController portController = TextEditingController();
  TextEditingController tokenController = TextEditingController();

  void saveSettings() async {
    // Save settings to local storage
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (state.settingsState.token == null ||
        state.settingsState.serverAddress == null ||
        state.settingsState.port == null) {
      throw Exception("token, serverAddress, port is null");
    }

    await prefs.setString(
        SharedPreferencesFieldName.token.name, state.settingsState.token!);
    await prefs.setString(SharedPreferencesFieldName.server_address.name,
        state.settingsState.serverAddress!);
    await prefs.setInt(
        SharedPreferencesFieldName.port.name, state.settingsState.port!);
    ref.read(settingsViewModelProvider.notifier).loadSettings();
  }

  void checkPortText(String value) {
    if (int.tryParse(value) == null) {
      state = state.copyWith(portHintText: "数字を入力してください");
    } else {
      state = state.copyWith(portHintText: null);
    }
  }

  void _writeTextFieldToState() {
    state = state.copyWith(
        settingsState: state.settingsState.copyWith(
            serverAddress: serverAddressController.text,
            port: int.tryParse(portController.text) ?? DefaultValue.defaultPort,
            token: tokenController.text));
  }

  void checkConnection() async {
    state = state.copyWith(isChecking: true);

    ProviderContainer container = ProviderContainer();
    RestApiConnectionResult result = await container
        .read(settingsViewModelProvider.notifier)
        .checkInvalidServer(SettingsState(
            token: tokenController.text,
            serverAddress: serverAddressController.text,
            port:
                int.tryParse(portController.text) ?? DefaultValue.defaultPort));

    state = state.copyWith(
        hintText: result.errorMessage,
        isChecking: false,
        isSuccessful: result.status == RestApiConnectionStatus.success);
    if (state.isSuccessful) {
      _writeTextFieldToState();
    }
  }
}
