import 'package:accountbook_for_obsidian_rest_api/model/post_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostViewModel extends StateNotifier<PostState> {
  PostViewModel()
      : super(PostState(
            date: DateTime.now(),
            week: _getWeekNumber(DateTime.now()),
            category: [],
            price: 0,
            method: "クレジットカード",
            other: ""));
  void changeDate(DateTime date) {
    state = state.copyWith(date: date, week: _getWeekNumber(date));
  }
}

final postViewModelProvider =
    StateNotifierProvider.autoDispose<PostViewModel, PostState>(
        (ref) => PostViewModel());

int _getWeekNumber(DateTime date) {
  int weekNumber = (date.day / 7).ceil();
  return weekNumber;
}
