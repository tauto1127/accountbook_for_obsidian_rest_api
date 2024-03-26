import 'dart:convert';
import 'dart:io';

import 'package:accountbook_for_obsidian_rest_api/const/default_value.dart';
import 'package:accountbook_for_obsidian_rest_api/model/post_model.dart';
import 'package:accountbook_for_obsidian_rest_api/model/state/post_state.dart';
import 'package:accountbook_for_obsidian_rest_api/model/rest_api/rest_api_status_model.dart';
import 'package:accountbook_for_obsidian_rest_api/model/settings_model.dart';
import 'package:accountbook_for_obsidian_rest_api/notifier/settings_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class ObsidianRepository {
  static Future<RestApiConnectionResult> checkInvalidServer(SettingsModel settingState) async {
    // 接続のチェックを行うロジックを実装する
    try {
      Uri uri = _getUri(settingState);
      //debugPrint("$settingState.token");
      http.Response response =
          await http.get(uri, headers: {"Authorization": DefaultValue.authorizationHeaderPrefix + settingState.token!});

      debugPrint(
          "check connection ¥n serverAddress: ${settingState.serverAddress}, port: ${settingState.port}, token: ${settingState.token}");

      if (settingState.token == null) {
        return RestApiConnectionResult(RestApiConnectionStatus.invalidToken, 'Invalid token');
      }

      if (response.statusCode != 200) {
        return RestApiConnectionResult(RestApiConnectionStatus.connectionError, 'Connection error. Status code: ${response.statusCode}');
      }
      RestApiStatusModel status = RestApiStatusModel.fromJson(jsonDecode(response.body));
      if (status.authenticated) {
        return RestApiConnectionResult(RestApiConnectionStatus.success, 'succeed');
      }
      if (status.status != "OK") {
        return RestApiConnectionResult(RestApiConnectionStatus.statusNotOk, 'Status is not OK');
      }
      return RestApiConnectionResult(RestApiConnectionStatus.invalidToken, 'Invalid token');
    } catch (e) {
      switch (e) {
        case FormatException:
          return RestApiConnectionResult(RestApiConnectionStatus.invalidUrl, 'Invalid URL');
        case HandshakeException:
          return RestApiConnectionResult(RestApiConnectionStatus.certificateError, 'Certificate error, httpsの認証をしてください');
        default:
          return RestApiConnectionResult(RestApiConnectionStatus.error, 'Unknown error $e');
      }
    }
  }

  static Future<RestApiConnectionResult> addPost(PostModel post, PostState postState, BuildContext context) async {
    SettingsModel settings = ProviderScope.containerOf(context).read(settingsNotifierProvider);
    debugPrint('token: ${settings.token}, serverAddress: ${settings.serverAddress}, port: ${settings.port}');
    //TODO rootPathのさまざまな条件のハンドリング
    Uri uri = Uri.parse('${_getUri(settings).toString()}/vault${settings.rootPath}/${post.title}');

    http.Response res = await http.post(
        headers: {"Authorization": DefaultValue.authorizationHeaderPrefix + settings.token!, "Content-Type": "text/markdown"},
        body: post.body,
        uri);
    switch (res.statusCode) {
      case 200:
        return RestApiConnectionResult(RestApiConnectionStatus.success, "succeed");
      case 401:
        return RestApiConnectionResult(RestApiConnectionStatus.invalidToken, "Invalid token");
      default:
        return RestApiConnectionResult(RestApiConnectionStatus.error, "Unknown error");
    }
  }

  static Uri _getUri(SettingsModel setting) => Uri.parse("${setting.serverAddress}:${setting.port}");
}

class RestApiConnectionResult {
  final RestApiConnectionStatus status;
  final String errorMessage;

  RestApiConnectionResult(
    this.status,
    this.errorMessage,
  );
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
