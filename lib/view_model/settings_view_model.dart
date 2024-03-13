import 'dart:convert';
import 'dart:io';

import 'package:accountbook_for_obsidian_rest_api/const/shared_preferences_field_nae.dart';
import 'package:accountbook_for_obsidian_rest_api/model/rest_api/rest_api_status_model.dart';
import 'package:accountbook_for_obsidian_rest_api/model/settings_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart';

const int defaultPort = 27124;
const String authorizationHeaderPrefix = "Bearer ";

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
    state = state.copyWith(
        token: prefs.getString(SharedPreferencesFieldName.token.name),
        port: prefs.getInt(SharedPreferencesFieldName.port.name) ?? defaultPort,
        serverAddress:
            prefs.getString(SharedPreferencesFieldName.server_address.name),
        category: prefs.getStringList(SharedPreferencesFieldName.category.name),
        method: prefs.getStringList(SharedPreferencesFieldName.method.name));
  }

  void saveServerSettings() async {
    // Save settings to local storage
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (await checkInvalidServer(state) != RestApiConnectionStatus.success) {
      throw Exception('有効ではないサーバーアドレスまたはポートまたはトークン');
    }
    await prefs.setString(SharedPreferencesFieldName.token.name, state.token!);
    await prefs.setInt(
        SharedPreferencesFieldName.port.name, state.port ?? defaultPort);
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

  Future<RestApiConnectionResult> checkInvalidServer(
      SettingsState? settingState) async {
    SettingsState setting = settingState ?? state;

    // 接続のチェックを行うロジックを実装する
    try {
      Uri uri = Uri.parse("${setting.serverAddress}:${setting.port}");
      debugPrint("$setting.token");

      if (setting.token == null) {
        return RestApiConnectionResult(
            RestApiConnectionStatus.invalidToken, 'Invalid token');
      }

      Response response = await get(uri, headers: {
        "Authorization": authorizationHeaderPrefix + setting.token!
      });
      debugPrint(
          "check connection ¥n serverAddress: ${setting.serverAddress}, port: ${setting.port}, token: ${setting.token}");

      if (response.statusCode != 200) {
        return RestApiConnectionResult(RestApiConnectionStatus.connectionError,
            'Connection error. Status code: ${response.statusCode}');
      }
      RestApiStatusModel status =
          RestApiStatusModel.fromJson(jsonDecode(response.body));
      if (status.authenticated) {
        return RestApiConnectionResult(
            RestApiConnectionStatus.success, 'succeed');
      }
      if (status.status != "OK") {
        return RestApiConnectionResult(
            RestApiConnectionStatus.statusNotOk, 'Status is not OK');
      }
      return RestApiConnectionResult(
          RestApiConnectionStatus.invalidToken, 'Invalid token');
    } catch (e) {
      switch (e) {
        case FormatException:
          return RestApiConnectionResult(
              RestApiConnectionStatus.invalidUrl, 'Invalid URL');
        case HandshakeException:
          return RestApiConnectionResult(
              RestApiConnectionStatus.certificateError,
              'Certificate error, httpsの認証をしてください');
        default:
          return RestApiConnectionResult(
              RestApiConnectionStatus.error, 'Unknown error $e');
      }
    }
  }
}

class RestApiConnectionResult {
  final RestApiConnectionStatus status;
  final String errorMessage;

  RestApiConnectionResult(this.status, this.errorMessage);
}

enum RestApiConnectionStatus {
  success,
  connectionError,
  invalidUrl,
  invalidToken,
  statusNotOk,
  certificateError,
  error,
}
