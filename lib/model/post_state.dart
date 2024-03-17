import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_state.freezed.dart';

@freezed
class PostState with _$PostState {
  factory PostState({
    required String place,
    required DateTime date,
    required int week,
    String? category,
    required int price,
    String? method,
    required String other,
  }) = _PostState;
}
