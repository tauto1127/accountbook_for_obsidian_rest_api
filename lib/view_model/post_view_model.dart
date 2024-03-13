import 'package:accountbook_for_obsidian_rest_api/model/post_state.dart';
import 'package:accountbook_for_obsidian_rest_api/view_model/template_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostViewModel extends StateNotifier<PostState> {
  final StateNotifierProviderRef ref;
  PostViewModel(this.ref)
      : super(PostState(
            date: DateTime.now(),
            week: _getWeekNumber(DateTime.now()),
            category: [],
            price: 0,
            method: "クレジットカード",
            other: "other")) {
    dateController.text = DateTime.now().toString();
  }

  TextEditingController dateController = TextEditingController();

  void changeDate(DateTime date) {
    state = state.copyWith(date: date, week: _getWeekNumber(date));
    dateController.text = date.toString();
  }

  void addPost() async {}
  void generatePost() {
    String out =
        ref.read(templateNotifierProvider.notifier).generatePost(state);
    print(out);
    state.copyWith(other: out);
  }
}

final postViewModelProvider =
    StateNotifierProvider.autoDispose<PostViewModel, PostState>(
        (ref) => PostViewModel(ref));

int _getWeekNumber(DateTime date) {
  int weekNumber = (date.day / 7).ceil();
  return weekNumber;
}
