import 'package:accountbook_for_obsidian_rest_api/const/default_value.dart';
import 'package:accountbook_for_obsidian_rest_api/const/shared_preferences_field_nae.dart';
import 'package:accountbook_for_obsidian_rest_api/model/post_model.dart';
import 'package:accountbook_for_obsidian_rest_api/model/state/post_state.dart';
import 'package:accountbook_for_obsidian_rest_api/model/template_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const defaultTemplate = "default";

final templateNotifierProvider =
    StateNotifierProvider<TemplateNotifier, TemplateModel>((ref) => TemplateNotifier(TemplateModel(bodyTemplate: "", titleTemplate: "")));

class TemplateNotifier extends StateNotifier<TemplateModel> {
  TemplateNotifier(TemplateModel template) : super(template);

  Future<TemplateModel> loadTemplate() async {
    // Load settings from local storage
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    state = TemplateModel(bodyTemplate: prefs.getString(SharedPreferencesFieldName.body_template.name) ?? DefaultValue.defaultBodyTemplate, titleTemplate: prefs.getString(SharedPreferencesFieldName.title_template.name) ?? DefaultValue.defaultTitleTemplate);
    return state;
  }

  void saveTemplate(TemplateModel str) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (await prefs.setString(SharedPreferencesFieldName.body_template.name, str.bodyTemplate) && await prefs.setString(SharedPreferencesFieldName.title_template.name, str.titleTemplate)) {
      state = str;
    } else {
      throw Exception('Failed to save template');
    }
  }

  PostModel generatePost(PostState postState) {
    if (state.bodyTemplate.isEmpty || state.titleTemplate.isEmpty) throw Exception("state is null");
    return PostModel(
        body: replaceWords(state.bodyTemplate, postState),
        title: replaceWords(state.titleTemplate, postState));
  }
  
  String replaceWords(String str, PostState postState)
    => str.replaceAll(r"{{YYYY}}", postState.date.year.toString())
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
