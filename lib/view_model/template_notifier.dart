import 'package:accountbook_for_obsidian_rest_api/view_model/template_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const defaultTemplate = "default";

final templateNotifierProvider =
    StateNotifierProvider<TemplateNotifier, String>(
        (ref) => TemplateNotifier("", ref));

class TemplateNotifier extends StateNotifier<String> {
  TemplateNotifier(String template, this.ref) : super(template) {
    loadTemplate();
  }

  final StateNotifierProviderRef ref;

  void loadTemplate() async {
    // Load settings from local storage
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    state = prefs.getString('template') ?? defaultTemplate;
    ref
        .read(templateViewModelProvider.notifier)
        .templateTextFieldController
        .text = state;
  }

  void saveTemplate(String str) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (await prefs.setString('template', str)) {
      state = str;
    } else {
      throw Exception('Failed to save template');
    }
  }
}
