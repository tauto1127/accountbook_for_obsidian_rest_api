import 'package:accountbook_for_obsidian_rest_api/model/settings_model.dart';
import 'package:accountbook_for_obsidian_rest_api/view_model/settings_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final signupViewModelProvider =
    StateNotifierProvider.autoDispose<SignupViewModel, SettingsState>(
        (ref) => SignupViewModel(ref.watch(settingsViewModelProvider)));

class SignupViewModel extends StateNotifier<SettingsState> {
  SignupViewModel(SettingsState state) : super(state);

  //ここのstateが変わっても，再ビルドはされない
  TextEditingController serverAddressController = TextEditingController();
  TextEditingController portController = TextEditingController();
  TextEditingController tokenController = TextEditingController();

  void saveSettings() async {
    // Save settings to local storage
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (state.token == null ||
        state.serverAddress == null ||
        state.port == null) {
      throw Exception("token, serverAddress, port is null");
    }

    await prefs.setString('token', state.token!);
    await prefs.setString('server_addres', state.serverAddress!);
    await prefs.setInt('port', state.port!);
  }

  //void loadSettings() async {
  //  // Load settings from local storage
  //  final SharedPreferences prefs = await SharedPreferences.getInstance();
  //  state = state.copyWith(token: prefs.getString('token'));
  //  print("token: ${state.token}");
  //}

  //void saveSettings() async {
  //  // Save settings to local storage
  //  final SharedPreferences prefs = await SharedPreferences.getInstance();
  //  await prefs.setString('token', state.token!);
  //}

  //void setToken(String value) {
  //  state = state.copyWith(token: value);
  //  print("token: ${state.token}");
  //}
}
