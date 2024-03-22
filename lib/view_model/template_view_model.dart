import 'package:accountbook_for_obsidian_rest_api/model/state/template_state.dart';
import 'package:accountbook_for_obsidian_rest_api/notifier/template_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final templateViewModelProvider = StateNotifierProvider.autoDispose<TemplateViewModel, TemplateState>(
    (ref) => TemplateViewModel(TemplateState(), TextEditingController(text: ref.watch(templateNotifierProvider))));

class TemplateViewModel extends StateNotifier<TemplateState> {
  final TextEditingController templateTextFieldController;
  TemplateViewModel(TemplateState state, this.templateTextFieldController) : super(state);

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
    ProviderContainer().read(templateNotifierProvider.notifier).saveTemplate(templateTextFieldController.text);
  }
  
  void reset() {
    templateTextFieldController.text = "";
  }
}
