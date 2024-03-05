import 'package:accountbook_for_obsidian_rest_api/model/signup_state.dart';
import 'package:accountbook_for_obsidian_rest_api/view_model/signup_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const defaultTemplate = "default";

final templateNotifierProvider =
    StateNotifierProvider<TemplateNotifier, String>(
        (ref) => TemplateNotifier(""));

class TemplateNotifier extends StateNotifier<String> {
  TemplateNotifier(String template) : super(template) {
    loadTemplate();
  }

  void loadTemplate() async {
    // Load settings from local storage
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    state = prefs.getString('template') ?? defaultTemplate;
  }
}
