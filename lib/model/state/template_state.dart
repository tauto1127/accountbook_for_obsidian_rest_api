import 'package:freezed_annotation/freezed_annotation.dart';

part 'template_state.freezed.dart';

@freezed
class TemplateState with _$TemplateState {
  factory TemplateState({
    String? errorText,
  }) = _TemplateState;
}
