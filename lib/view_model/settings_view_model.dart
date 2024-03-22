import 'package:accountbook_for_obsidian_rest_api/const/default_value.dart';
import 'package:accountbook_for_obsidian_rest_api/model/settings_model.dart';
import 'package:accountbook_for_obsidian_rest_api/view_model/settings_notifier.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingsViewModelProvider =
    StateNotifierProvider.autoDispose<SettingsViewModel, SettingsModel>((ref) => SettingsViewModel(ref.read(settingsNotifierProvider)));

class SettingsViewModel extends StateNotifier<SettingsModel> {
  SettingsViewModel(SettingsModel state) : super(state){
    tokenController.text = state.token ?? "";
    serverAddressController.text = state.serverAddress ?? "";
    portController.text = state.port?.toString() ?? DefaultValue.defaultPort.toString();
    rootPathController.text = state.rootPath ?? DefaultValue.defaultRootPath;
    debugPrint(
        'value setted: {token: ${state.token}, serverAddress: ${state.serverAddress}, port: ${state.port}, rootPath: ${state.rootPath}}');
  }

  TextEditingController tokenController = TextEditingController();
  TextEditingController serverAddressController = TextEditingController();
  TextEditingController portController = TextEditingController();
  TextEditingController rootPathController = TextEditingController();

  
}
