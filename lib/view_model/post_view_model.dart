import 'package:accountbook_for_obsidian_rest_api/model/post_state.dart';
import 'package:accountbook_for_obsidian_rest_api/repository/obsidian_repository.dart';
import 'package:accountbook_for_obsidian_rest_api/view_model/template_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostViewModel extends StateNotifier<PostState> {
  final StateNotifierProviderRef ref;
  PostViewModel(this.ref)
      : super(PostState(
            date: DateTime.now(),
            week: _getWeekNumber(DateTime.now()),
            category: null,
            price: 0,
            method: null,
            other: "",
            place: '')) {
    placeController.text = state.place;
    dateController.text = DateTime.now().toString();
    priceController.text = state.price.toString();
    otherController.text = state.other;
  }

  TextEditingController placeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController otherController = TextEditingController();

  void changeDate(DateTime date) {
    state = state.copyWith(date: date, week: _getWeekNumber(date));
    dateController.text = date.toString();
  }

  void addPost(String body, BuildContext context) async {
    syncState();
    ObsidianRepository.addPost(body, state, context);
  }

  String generatePost() {
    state = state.copyWith(
        other: otherController.text, price: int.parse(priceController.text));
    return ref.read(templateNotifierProvider.notifier).generatePost(state);
  }

  void syncState() {
    state = state.copyWith(
        place: placeController.text,
        other: otherController.text,
        price: int.parse(priceController.text));
  }

  void changeCategory(String? value) => state = state.copyWith(category: value);
  void changeMethod(String? value) => state = state.copyWith(method: value);
}

final postViewModelProvider =
    StateNotifierProvider.autoDispose<PostViewModel, PostState>(
        (ref) => PostViewModel(ref));

int _getWeekNumber(DateTime date) {
  int weekNumber = (date.day / 7).ceil();
  return weekNumber;
}
