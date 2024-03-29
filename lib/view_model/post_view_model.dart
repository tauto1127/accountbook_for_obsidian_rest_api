import 'package:accountbook_for_obsidian_rest_api/model/post_model.dart';
import 'package:accountbook_for_obsidian_rest_api/model/state/post_state.dart';
import 'package:accountbook_for_obsidian_rest_api/notifier/settings_notifier.dart';
import 'package:accountbook_for_obsidian_rest_api/repository/obsidian_repository.dart';
import 'package:accountbook_for_obsidian_rest_api/notifier/template_notifier.dart';
import 'package:accountbook_for_obsidian_rest_api/view_model/settings_view_model.dart';
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
            place: '',
            categoryList: ref.read(settingsNotifierProvider).category!,
            methodList: ref.read(settingsNotifierProvider).method!)) {
    placeController.text = state.place;
    dateController.text = DateTime.now().toString();
    priceController.text = state.price.toString();
    otherController.text = state.other;
  }

  TextEditingController placeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController methodController = TextEditingController();
  TextEditingController otherController = TextEditingController();

  ScrollController scrollController = ScrollController(keepScrollOffset: false);

  void changeDate(DateTime date) {
    state = state.copyWith(date: date, week: _getWeekNumber(date));
    dateController.text = date.toString();
  }

  void addPost(PostModel post, BuildContext context) async {
    syncState();
    ObsidianRepository.addPost(post, state, context);
  }

  PostModel generatePost() {
    state = state.copyWith(other: otherController.text, price: int.parse(priceController.text));
    return ref.read(templateNotifierProvider.notifier).generatePost(state);
  }

  void syncState() {
    state = state.copyWith(place: placeController.text, other: otherController.text, price: int.parse(priceController.text));
  }

  void setIsEditingCategory(bool value) => state = state.copyWith(isEditingCategory: value);
  void setIsEditingMethod(bool value) => state = state.copyWith(isEditingMethod: value);

  void changeCategory(String? value) => state = state.copyWith(category: value);
  void changeMethod(String? value) => state = state.copyWith(method: value);

  void setMethodFormOffsetTop(double value) => state = state.copyWith(methodFormOffsetTop: value);
  void setOtherFormOffsetTop(double value) => state = state.copyWith(otherFormOffsetTop: value);

  void setCategoryQuery(String value) {
    state = state.copyWith(categoryQuery: value, categoryList: ref.read(settingsNotifierProvider.notifier).searchCategory(value));
  }

  void setMethodQuery(String value) =>
      state = state.copyWith(methodQuery: value, methodList: ref.read(settingsNotifierProvider.notifier).searchMethod(value));

  void addToCategoryList(String value) {
    ref.read(settingsNotifierProvider.notifier).addToCategories(value);
    state = state.copyWith(categoryList: ref.read(settingsNotifierProvider).category!);
  }

  void addToMethodList(String value) {
    ref.read(settingsNotifierProvider.notifier).addToMethods(value);
    state = state.copyWith(methodList: ref.read(settingsNotifierProvider).method!);
  }

  void changeScroll(double value) {
    scrollController.jumpTo(value);
  }
}

final postViewModelProvider = StateNotifierProvider.autoDispose<PostViewModel, PostState>((ref) => PostViewModel(ref));

int _getWeekNumber(DateTime date) {
  int weekNumber = (date.day / 7).ceil();
  return weekNumber;
}
