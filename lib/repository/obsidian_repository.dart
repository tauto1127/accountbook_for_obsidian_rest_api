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

final obsidianRepositoryProvider = Provider<ObsidianRepositoryInterface>((ref) => ObsidianRepository());

abstract class ObsidianRepositoryInterface {
  Future<RestApiConnectionResult> checkInvalidServer(SettingsModel settingState);
  Future<RestApiConnectionResult> addPost(PostModel post, PostState postState, BuildContext context);
}

class ObsidianTestRepository implements ObsidianRepositoryInterface {
  @override
  Future<RestApiConnectionResult> checkInvalidServer(SettingsModel settingState) async {
    return RestApiConnectionResult(RestApiConnectionStatus.connectionError, 'connection error');
  }

  @override
  Future<RestApiConnectionResult> addPost(PostModel post, PostState postState, BuildContext context) async {
    debugPrint("テスト用リポジトリ：${post.title}を追加しました");
    return RestApiConnectionResult(RestApiConnectionStatus.certificateError, 'certificate error');
  }
}

class ObsidianRepository implements ObsidianRepositoryInterface {
  @override
  Future<RestApiConnectionResult> checkInvalidServer(SettingsModel settingState) async {
    // 接続のチェックを行うロジックを実装する
    try {
      Uri uri = _getUri(settingState);
      if (settingState.token == null) {
        return RestApiConnectionResult(RestApiConnectionStatus.invalidToken, 'Invalid token');
      }
      http.Response response =
          await http.get(uri, headers: {"Authorization": DefaultValue.authorizationHeaderPrefix + settingState.token!});

      debugPrint(
          "check connection ¥n serverAddress: ${settingState.serverAddress}, port: ${settingState.port}, token: ${settingState.token}");

      if (response.statusCode != 200) {
        return RestApiConnectionResult(RestApiConnectionStatus.connectionError, 'Connection error. Status code: ${response.statusCode}');
      }
      RestApiStatusModel status = RestApiStatusModel.fromJson(jsonDecode(response.body));
      if (status.authenticated) {
        return RestApiConnectionResult(RestApiConnectionStatus.success, '');
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

  @override
  Future<RestApiConnectionResult> addPost(PostModel post, PostState postState, BuildContext context) async {
    SettingsModel settings = ProviderScope.containerOf(context).read(settingsNotifierProvider);
    debugPrint('token: ${settings.token}, serverAddress: ${settings.serverAddress}, port: ${settings.port}');
    //TODO rootPathのさまざまな条件のハンドリング
    //TODO タイトルに.mdがない時
    Uri uri = Uri.parse('${_getUri(settings).toString()}/vault${settings.rootPath}/${post.title}.md');
    if (settings.token == null) return RestApiConnectionResult(RestApiConnectionStatus.invalidToken, 'Invalid token');

    http.Response res = await http.post(
        headers: {"Authorization": DefaultValue.authorizationHeaderPrefix + settings.token!, "Content-Type": "text/markdown"},
        body: post.body,
        uri);
    debugPrint('putted ${uri.toString()}');
    debugPrint(res.statusCode.toString());
    switch (res.statusCode) {
      case 200:
        return RestApiConnectionResult(RestApiConnectionStatus.success, "");
      case 401:
        return RestApiConnectionResult(RestApiConnectionStatus.invalidToken, "Invalid token");
      default:
        return RestApiConnectionResult(RestApiConnectionStatus.error, "Unknown error, ${res.body}");
    }
  }

  Uri _getUri(SettingsModel setting) => Uri.parse("${setting.serverAddress}:${setting.port}");
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
