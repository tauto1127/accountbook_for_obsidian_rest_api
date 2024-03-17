import 'dart:convert';
import 'dart:io';

import 'package:accountbook_for_obsidian_rest_api/const/default_value.dart';
import 'package:accountbook_for_obsidian_rest_api/model/post_state.dart';
import 'package:accountbook_for_obsidian_rest_api/model/rest_api/rest_api_status_model.dart';
import 'package:accountbook_for_obsidian_rest_api/model/settings_model.dart';
import 'package:accountbook_for_obsidian_rest_api/view_model/settings_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

class ObsidianRepository {
  static Future<RestApiConnectionResult> checkInvalidServer(
      SettingsState settingState) async {
    // 接続のチェックを行うロジックを実装する
    try {
      Uri uri = _getUri(settingState);
      //debugPrint("$settingState.token");
      Response response = await get(uri, headers: {
        "Authorization":
            DefaultValue.authorizationHeaderPrefix + settingState.token!
      });

      debugPrint(
          "check connection ¥n serverAddress: ${settingState.serverAddress}, port: ${settingState.port}, token: ${settingState.token}");

      if (settingState.token == null) {
        return RestApiConnectionResult(
            RestApiConnectionStatus.invalidToken, 'Invalid token');
      }

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

  static Future<RestApiConnectionResult> addPost(
      String body, PostState postState, BuildContext context) async {
    //TODO 店名も渡す
    SettingsState settings =
        ProviderScope.containerOf(context).read(settingsViewModelProvider);
    debugPrint(
        'token: ${settings.token}, serverAddress: ${settings.serverAddress}, port: ${settings.port}');
    Uri uri = Uri.parse(
        '${_getUri(settings).toString()}/vault/${postState.date.toString()}${postState.price}.md');

    Response res = await post(headers: {
      "Authorization": DefaultValue.authorizationHeaderPrefix + settings.token!,
      "Content-Type": "text/markdown"
    }, body: body, uri);
    switch (res.statusCode) {
      case 200:
        return RestApiConnectionResult(
            RestApiConnectionStatus.success, "succeed");
      case 401:
        return RestApiConnectionResult(
            RestApiConnectionStatus.invalidToken, "Invalid token");
      default:
        return RestApiConnectionResult(
            RestApiConnectionStatus.error, "Unknown error");
    }
  }

  static Uri _getUri(SettingsState setting) =>
      Uri.parse("${setting.serverAddress}:${setting.port}");
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
