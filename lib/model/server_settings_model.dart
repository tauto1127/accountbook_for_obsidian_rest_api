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
}