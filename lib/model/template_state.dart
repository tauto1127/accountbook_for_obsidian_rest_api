import 'package:freezed_annotation/freezed_annotation.dart';

part 'template_state.freezed.dart';

@freezed
class TemplateState with _$TemplateState {
  factory TemplateState({
    required String template,
  }) = _TemplateState;
}
