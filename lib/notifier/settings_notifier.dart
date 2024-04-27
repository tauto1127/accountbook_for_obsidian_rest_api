import 'package:accountbook_for_obsidian_rest_api/const/default_value.dart';
import 'package:accountbook_for_obsidian_rest_api/const/shared_preferences_field_nae.dart';
import 'package:accountbook_for_obsidian_rest_api/model/server_settings_model.dart';
import 'package:accountbook_for_obsidian_rest_api/model/settings_model.dart';
import 'package:accountbook_for_obsidian_rest_api/repository/obsidian_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final settingsNotifierProvider = StateNotifierProvider<SettingsNotifier, SettingsModel>((ref) => SettingsNotifier(SettingsModel(), ref));

class SettingsNotifier extends StateNotifier<SettingsModel> {
  final StateNotifierProviderRef ref;
  SettingsNotifier(SettingsModel state, this.ref) : super(state);

  Future<void> loadSettings() async {
    // Load settings from local storage
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    state = state.copyWith(
      token: prefs.getString(SharedPreferencesFieldName.token.name),
      port: prefs.getInt(SharedPreferencesFieldName.port.name) ?? DefaultValue.defaultPort,
      serverAddress: prefs.getString(SharedPreferencesFieldName.server_address.name),
      category: prefs.getStringList(SharedPreferencesFieldName.category.name) ?? DefaultValue.defaultCategory,
      method: prefs.getStringList(SharedPreferencesFieldName.method.name) ?? DefaultValue.defaultMethod,
      rootPath: prefs.getString(SharedPreferencesFieldName.root_path.name) ?? DefaultValue.defaultRootPath,
    );
    if (kDebugMode) {
      print("settings loaded: $state");
    }
  }

  void _setCategory() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(SharedPreferencesFieldName.category.name, state.category!);
  }

  void _setMethod() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(SharedPreferencesFieldName.method.name, state.method!);
  }

  Future<void> saveServerSettings() async {
    // Save settings to local storage
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if ((await ref.read(obsidianRepositoryProvider).checkInvalidServer(state)).status != RestApiConnectionStatus.success) {
      throw Exception('有効ではないサーバーアドレスまたはポートまたはトークン');
    }
    await prefs.setString(SharedPreferencesFieldName.token.name, state.token!);
    await prefs.setInt(SharedPreferencesFieldName.port.name, state.port ?? DefaultValue.defaultPort);
    await prefs.setString(SharedPreferencesFieldName.server_address.name, state.serverAddress!);
    await prefs.setString(SharedPreferencesFieldName.root_path.name, state.rootPath ?? DefaultValue.defaultRootPath);
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

  Future<RestApiConnectionResult> saveServerSetting(ServerSettingsModel setting) async {
    if (Uri.tryParse(setting.serverAddress) == null) return RestApiConnectionResult(RestApiConnectionStatus.invalidUrl, "Invalid URL");
    RestApiConnectionResult result = await ref
        .read(obsidianRepositoryProvider)
        .checkInvalidServer(SettingsModel(port: setting.port, serverAddress: setting.serverAddress, token: setting.token));
    if (result.status == RestApiConnectionStatus.success) {
      state = state.copyWith(serverAddress: setting.serverAddress, port: setting.port, token: setting.token, rootPath: setting.rootPath);
      await saveServerSettings();
      return result;
    }
    return result;
  }

  List<String> searchCategory(String query) {
    if (query.isEmpty) return state.category!;
    return state.category!.where((element) => element.contains(query)).toList();
  }

  List<String> searchMethod(String query) {
    if (query.isEmpty) return state.method!;
    return state.method!.where((element) => element.contains(query)).toList();
  }

  void addToCategories(String str) {
    state = state.copyWith(category: [...state.category!, str]);
    _setCategory();
  }

  void deleteCategories(String str) {
    state = state.copyWith(category: state.category!.where((element) => element != str).toList());
    _setCategory();
  }

  void addToMethods(String str) {
    state = state.copyWith(method: [...state.method!, str]);
    _setMethod();
  }
}
