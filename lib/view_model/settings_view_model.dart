import 'dart:convert';
import 'dart:io';

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
    state = state.copyWith(token: prefs.getString('token'));
  }

  void saveSettings() async {
    // Save settings to local storage
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', state.token!);
  }

  void setToken(String value) {
    state = state.copyWith(token: value);
  }

  Future<RestApiConnectionResult> checkInvalidServer(
      String serverAddress, String token,
      {int port = defaultPort}) async {
    // 接続のチェックを行うロジックを実装する
    try {
      Uri uri = Uri.parse("$serverAddress:$port");

      Response response = await get(uri,
          headers: {"Authorization": authorizationHeaderPrefix + token});
      debugPrint("serverAddress: $serverAddress, port: $port, token: $token");

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
