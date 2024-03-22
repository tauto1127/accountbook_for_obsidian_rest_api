import 'package:accountbook_for_obsidian_rest_api/const/default_value.dart';
import 'package:accountbook_for_obsidian_rest_api/model/server_settings_model.dart';
import 'package:accountbook_for_obsidian_rest_api/model/settings_model.dart';
import 'package:accountbook_for_obsidian_rest_api/model/settings_state.dart';
import 'package:accountbook_for_obsidian_rest_api/repository/obsidian_repository.dart';
import 'package:accountbook_for_obsidian_rest_api/view_model/settings_notifier.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingsViewModelProvider = StateNotifierProvider.autoDispose<SettingsViewModel, SettingsState>((ref) => SettingsViewModel(
    SettingsState(
      setting: ServerSettingsModel.fromSettingsModel(
        ref.read(settingsNotifierProvider),
      ),
    ),
    ref));

class SettingsViewModel extends StateNotifier<SettingsState> {
  final StateNotifierProviderRef ref;
  SettingsViewModel(SettingsState state, this.ref) : super(state) {
    tokenController.text = state.setting.token;
    serverAddressController.text = state.setting.serverAddress;
    portController.text = state.setting.port.toString();
    rootPathController.text = state.setting.rootPath;
  }

  TextEditingController tokenController = TextEditingController();
  TextEditingController serverAddressController = TextEditingController();
  TextEditingController portController = TextEditingController();
  TextEditingController rootPathController = TextEditingController();

  Future<void> saveSettings() async {
    state = state.copyWith(
        setting: state.setting.copyWith(
          token: tokenController.text,
          serverAddress: serverAddressController.text,
          port: int.tryParse(portController.text) ?? DefaultValue.defaultPort,
          rootPath: rootPathController.text,
        ),
        isLoading: true,
        isOk: false);
    RestApiConnectionResult result = await ref.read(settingsNotifierProvider.notifier).saveServerSetting(state.setting);
    if (result.status == RestApiConnectionStatus.success) {
      state = state.copyWith(isOk: true, isLoading: false);
    } else {
      state = state.copyWith(isOk: false, isLoading: false, errorMessage: result.errorMessage);
    }
  }
}
