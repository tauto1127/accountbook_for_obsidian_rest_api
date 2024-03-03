import 'package:accountbook_for_obsidian_rest_api/model/signup_state.dart';
import 'package:accountbook_for_obsidian_rest_api/view_model/signup_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const defaultTemplate = "default";

final templateNotifierProvider =
    NotifierProvider<TemplateNotifier, String>(() => TemplateNotifier());

class TemplateNotifier extends Notifier<String> {
  @override
  String build() {
    return defaultTemplate;
  }
}
