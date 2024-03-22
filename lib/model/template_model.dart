import 'package:freezed_annotation/freezed_annotation.dart';

part 'template_model.freezed.dart';

@freezed
class TemplateModel with _$TemplateModel {

  factory TemplateModel({
    required String bodyTemplate,
    required String titleTemplate,
  }) = _TemplateModel;
}