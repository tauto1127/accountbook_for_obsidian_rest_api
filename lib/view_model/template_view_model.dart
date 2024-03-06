import 'package:accountbook_for_obsidian_rest_api/model/template_state.dart';
import 'package:accountbook_for_obsidian_rest_api/view_model/template_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final templateViewModelProvider =
    StateNotifierProvider.autoDispose<TemplateViewModel, TemplateState>(
        (ref) => TemplateViewModel(TemplateState(), ref));

class TemplateViewModel extends StateNotifier<TemplateState> {
  TemplateViewModel(TemplateState state, this.ref) : super(state) {
    loadTemplate();
  }
  final StateNotifierProviderRef ref;

  void loadTemplate() async {
    // Load settings from local storage
    ref.read(templateNotifierProvider.notifier).loadTemplate();
  }

  void resetErrorText() async {
    if (state.errorText != null) {
      state = state.copyWith(errorText: null);
    }
  }

  void saveTemplate() async {
    if (templateTextFieldController.text.isEmpty) {
      state = state.copyWith(errorText: 'Template is empty');
      return;
    }
    ref
        .read(templateNotifierProvider.notifier)
        .saveTemplate(templateTextFieldController.text);
  }

  TextEditingController templateTextFieldController = TextEditingController();
}
