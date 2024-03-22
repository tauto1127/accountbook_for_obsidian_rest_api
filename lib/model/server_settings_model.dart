import 'package:accountbook_for_obsidian_rest_api/const/default_value.dart';
import 'package:accountbook_for_obsidian_rest_api/model/settings_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'server_settings_model.freezed.dart';

@freezed
class ServerSettingsModel with _$ServerSettingsModel {

  factory ServerSettingsModel({
    required String serverAddress,
    required int port,
    required String token,
    required String rootPath,
  }) = _ServerSettingsModel;
  
  factory ServerSettingsModel.fromSettingsModel(SettingsModel setting) {
    return ServerSettingsModel(
      serverAddress: setting.serverAddress ?? "",
      port: setting.port ?? DefaultValue.defaultPort,
      token: setting.token ?? "",
      rootPath: setting.rootPath ?? DefaultValue.defaultRootPath,
    );
  }
}