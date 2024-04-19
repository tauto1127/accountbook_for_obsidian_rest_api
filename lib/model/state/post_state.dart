import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_state.freezed.dart';

@freezed
class PostState with _$PostState {
  factory PostState({
    required String place,
    required DateTime date,
    required int week,
    //#TODO categoryとmethodをrequiredにする
    String? category,
    required int price,
    String? method,
    required String other,
    @Default(false) bool isEditingCategory,
    @Default(false) bool isEditingMethod,
    @Default(0) double methodFormOffsetTop,
    @Default(0) double otherFormOffsetTop,
    @Default(0) double placeFormOffsetTop,
    @Default("") String categoryQuery,
    @Default("") String methodQuery,
    required List<String> categoryList,
    required List<String> methodList,
  }) = _PostState;
}
