import 'dart:convert';
import 'dart:io';

import 'package:accountbook_for_obsidian_rest_api/const/default_value.dart';
import 'package:accountbook_for_obsidian_rest_api/const/shared_preferences_field_nae.dart';
import 'package:accountbook_for_obsidian_rest_api/model/rest_api/rest_api_status_model.dart';
import 'package:accountbook_for_obsidian_rest_api/model/settings_model.dart';
import 'package:accountbook_for_obsidian_rest_api/repository/obsidian_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart';

final settingsViewModelProvider =
    StateNotifierProvider<SettingsViewModel, SettingsState>(
        (ref) => SettingsViewModel(SettingsState()));

class SettingsViewModel extends StateNotifier<SettingsState> {
  SettingsViewModel(SettingsState state) : super(state);

  Future<void> loadSettings() async {
    // Load settings from local storage
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    state = state.copyWith(
        token: prefs.getString(SharedPreferencesFieldName.token.name),
        port: prefs.getInt(SharedPreferencesFieldName.port.name) ??
            DefaultValue.defaultPort,
        serverAddress:
            prefs.getString(SharedPreferencesFieldName.server_address.name),
        category:
            prefs.getStringList(SharedPreferencesFieldName.category.name) ??
                DefaultValue.defaultCategory,
        method: prefs.getStringList(SharedPreferencesFieldName.method.name) ??
            DefaultValue.defaultMethod);
    print("settings loaded: $state");
  }

  void saveServerSettings() async {
    // Save settings to local storage
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (await checkInvalidServer(state) != RestApiConnectionStatus.success) {
      throw Exception('有効ではないサーバーアドレスまたはポートまたはトークン');
    }
    await prefs.setString(SharedPreferencesFieldName.token.name, state.token!);
    await prefs.setInt(SharedPreferencesFieldName.port.name,
        state.port ?? DefaultValue.defaultPort);
    await prefs.setString(
        SharedPreferencesFieldName.server_address.name, state.serverAddress!);
  }

  void setToken(String value) {
    state = state.copyWith(token: value);
  }

  void setServerAddress(String value) {
    state = state.copyWith(serverAddress: value);
  }

  void setPort(int value) {
    state = state.copyWith(port: value);
  }

  checkInvalidServer(SettingsState settingsState) {}
}
