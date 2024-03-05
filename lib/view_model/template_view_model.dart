import 'package:accountbook_for_obsidian_rest_api/model/template_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final templateViewModelProvider =
    StateNotifierProvider<TemplateViewModel, TemplateState>(
        (ref) => TemplateViewModel(TemplateState(template: defaultTemplate)));

class TemplateViewModel extends StateNotifier<TemplateState> {
  TemplateViewModel(TemplateState state) : super(state) {
    templateTextFieldController.text = defaultTemplate;
  }

  void loadSettings() async {
    // Load settings from local storage
    state = state.copyWith(
        template: prefs.getString('template') ?? defaultTemplate);
  }

  TextEditingController templateTextFieldController = TextEditingController();
}
