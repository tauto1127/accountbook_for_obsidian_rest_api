import 'package:accountbook_for_obsidian_rest_api/model/post_state.dart';
import 'package:accountbook_for_obsidian_rest_api/view_model/template_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const defaultTemplate = "default";

final templateNotifierProvider =
    StateNotifierProvider<TemplateNotifier, String>(
        (ref) => TemplateNotifier("", ref));

class TemplateNotifier extends StateNotifier<String> {
  TemplateNotifier(String template, this.ref) : super(template);

  final StateNotifierProviderRef ref;

  Future<void> loadTemplate() async {
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

  String generatePost(PostState postState) {
    if (state.isEmpty) throw Exception("state is null");
    return state
        .replaceAll(r"{{YYYY}}", postState.date.year.toString())
        .replaceAll(r"{{M}}", postState.date.month.toString())
        .replaceAll(r'{{MM}}', postState.date.month.toString().padLeft(2, '0'))
        .replaceAll(r"{{D}}", postState.date.day.toString())
        .replaceAll(r"{{DD}}", postState.date.day.toString().padLeft(2, '0'))
        .replaceAll(r"{{W}}", postState.week.toString())
        .replaceAll(r"{{place}}", postState.place)
        .replaceAll(r"{{category}}", postState.category ?? "")
        .replaceAll(r"{{price}}", postState.price.toString())
        .replaceAll(r"{{method}}", postState.method ?? "")
        .replaceAll(r"{{other}}", postState.other);
  }
}
