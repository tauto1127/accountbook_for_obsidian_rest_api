import 'package:accountbook_for_obsidian_rest_api/model/signup_state.dart';
import 'package:accountbook_for_obsidian_rest_api/view_model/settings_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final signupViewModelProvider =
    StateNotifierProvider.autoDispose<SignupViewModel, SignupState>((ref) =>
        SignupViewModel(
            SignupState(settingsState: ref.watch(settingsViewModelProvider))));

class SignupViewModel extends StateNotifier<SignupState> {
  SignupViewModel(SignupState state) : super(state);

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

    await prefs.setString('token', state.settingsState.token!);
    await prefs.setString('server_addres', state.settingsState.serverAddress!);
    await prefs.setInt('port', state.settingsState.port!);
  }

  void checkPortText(String value) {
    if (int.tryParse(value) == null) {
      state = state.copyWith(portHintText: "数字を入力してください");
    } else {
      state = state.copyWith(portHintText: null);
    }
  }

  void checkConnection() async {
    ProviderContainer container = ProviderContainer();
    RestApiConnectionResult result = await container
        .read(settingsViewModelProvider.notifier)
        .checkInvalidServer(serverAddressController.text, tokenController.text,
            port: int.parse(portController.text));
    state = state.copyWith(hintText: result.errorMessage);
  }
}
