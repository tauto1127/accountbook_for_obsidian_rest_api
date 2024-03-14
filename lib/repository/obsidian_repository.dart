import 'dart:convert';
import 'dart:io';

import 'package:accountbook_for_obsidian_rest_api/const/default_value.dart';
import 'package:accountbook_for_obsidian_rest_api/model/rest_api/rest_api_status_model.dart';
import 'package:accountbook_for_obsidian_rest_api/model/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ObsidianRepository {
//  static Future<void> AddNote(String text) {}
  static Future<RestApiConnectionResult> checkInvalidServer(
      SettingsState settingState) async {
    // 接続のチェックを行うロジックを実装する
    try {
      Uri uri = Uri.parse("${settingState.serverAddress}:${settingState.port}");
      debugPrint("$settingState.token");

      if (settingState.token == null) {
        return RestApiConnectionResult(
            RestApiConnectionStatus.invalidToken, 'Invalid token');
      }

      Response response = await get(uri, headers: {
        "Authorization":
            DefaultValue.authorizationHeaderPrefix + settingState.token!
      });
      debugPrint(
          "check connection ¥n serverAddress: ${settingState.serverAddress}, port: ${settingState.port}, token: ${settingState.token}");

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
