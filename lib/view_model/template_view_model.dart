import 'package:accountbook_for_obsidian_rest_api/model/template_state.dart';
import 'package:accountbook_for_obsidian_rest_api/view_model/template_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final templateViewModelProvider =
    StateNotifierProvider<TemplateViewModel, TemplateState>(
        (ref) => TemplateViewModel(TemplateState(template: ""), ref));

class TemplateViewModel extends StateNotifier<TemplateState> {
  TemplateViewModel(TemplateState state, this.ref) : super(state) {
    loadTemplate();
  }
  final StateNotifierProviderRef ref;

  void loadTemplate() async {
    // Load settings from local storage
    ref.read(templateNotifierProvider.notifier).loadTemplate();
  }

  void saveTemplate() async {
    ref
        .read(templateNotifierProvider.notifier)
        .saveTemplate(templateTextFieldController.text);
  }

  TextEditingController templateTextFieldController = TextEditingController();
}
