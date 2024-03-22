import 'package:accountbook_for_obsidian_rest_api/model/post_model.dart';
import 'package:accountbook_for_obsidian_rest_api/model/state/post_state.dart';
import 'package:accountbook_for_obsidian_rest_api/view_model/template_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const defaultTemplate = "default";

final templateNotifierProvider = StateNotifierProvider<TemplateNotifier, String>((ref) => TemplateNotifier(""));

class TemplateNotifier extends StateNotifier<String> {
  TemplateNotifier(String template) : super(template);

  Future<String> loadTemplate() async {
    // Load settings from local storage
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    state = prefs.getString('template') ?? defaultTemplate;
    return state;
  }

  void saveTemplate(String str) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (await prefs.setString('template', str)) {
      state = str;
    } else {
      throw Exception('Failed to save template');
    }
  }

  PostModel generatePost(PostState postState) {
    String fileName = '${postState.place}_${postState.date.year}年${postState.date.month}月${postState.date.day}日.md';

    if (state.isEmpty) throw Exception("state is null");
    return PostModel(
        body: state
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
            .replaceAll(r"{{other}}", postState.other),
        title: fileName);
  }
}
