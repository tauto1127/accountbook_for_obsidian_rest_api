import 'package:accountbook_for_obsidian_rest_api/model/settings_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final settingsViewModelProvider =
    StateNotifierProvider<SettingsViewModel, SettingsState>(
        (ref) => SettingsViewModel(SettingsState()));

class SettingsViewModel extends StateNotifier<SettingsState> {
  SettingsViewModel(SettingsState state) : super(state) {
    loadSettings();
  }

  void loadSettings() async {
    // Load settings from local storage
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    state = state.copyWith(token: prefs.getString('token'));
    print("token: ${state.token}");
  }

  void saveSettings() async {
    // Save settings to local storage
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', state.token!);
  }

  void setToken(String value) {
    state = state.copyWith(token: value);
    print("token: ${state.token}");
  }
}
