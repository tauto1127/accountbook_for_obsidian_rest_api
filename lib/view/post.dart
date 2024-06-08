import 'package:accountbook_for_obsidian_rest_api/model/post_model.dart';
import 'package:accountbook_for_obsidian_rest_api/view/version_label.dart';
import 'package:accountbook_for_obsidian_rest_api/view_model/post_view_model.dart';
import 'package:accountbook_for_obsidian_rest_api/notifier/settings_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Post extends StatelessWidget {
  const Post({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey methodFormKey = GlobalKey();
    final GlobalKey otherFormKey = GlobalKey(); //Padding(
    final GlobalKey placeFormKey = GlobalKey();
    final FocusNode methodFocusNode = FocusNode();
    final FocusNode categoryFocusNode = FocusNode();

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
              title: const Text('Post'),
              leading: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () => Navigator.of(context).pushNamed('template_editor'),
              ),
              actions: [
                Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  return IconButton(
                      icon: const Icon(Icons.computer),
                      onPressed: ()

                          /// whenCompleteがないとsetting画面が残ったまんまになる
                          =>
                          Navigator.of(context).pushNamed('settings').whenComplete(() => ref.read(postViewModelProvider)));
                }),
              ]),
          body: Consumer(builder: (context, ref, child) {
            return SingleChildScrollView(
              controller: ref.read(postViewModelProvider.notifier).scrollController,
              child: Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (ref.read(postViewModelProvider).methodFormOffsetTop == 0) {
                    final RenderBox renderBox = methodFormKey.currentContext!.findRenderObject() as RenderBox;
                    final double offset = renderBox.localToGlobal(Offset.zero).dy;
                    ref.read(postViewModelProvider.notifier).setMethodFormOffsetTop(offset);
                    debugPrint('offset: ${ref.read(postViewModelProvider).methodFormOffsetTop}');
                  }
                  if (ref.read(postViewModelProvider).otherFormOffsetTop == 0) {
                    final RenderBox renderBox = otherFormKey.currentContext!.findRenderObject() as RenderBox;
                    final double offset = renderBox.localToGlobal(Offset.zero).dy;
                    ref.read(postViewModelProvider.notifier).setOtherFormOffsetTop(offset);
                  }
                  if (ref.read(postViewModelProvider).placeFormOffsetTop == 0) {
                    final RenderBox renderBox = placeFormKey.currentContext!.findRenderObject() as RenderBox;
                    final double offset = renderBox.localToGlobal(Offset.zero).dy;
                    ref.read(postViewModelProvider.notifier).setPlaceFormOffsetTop(offset);
                  }
                });

                methodFocusNode.addListener(() {
                  if (methodFocusNode.hasFocus) {
                    ref.read(postViewModelProvider.notifier).setIsEditingMethod(true);
                  } else {
                    ref.read(postViewModelProvider.notifier).setIsEditingMethod(false);
                  }
                });
                categoryFocusNode.addListener(() {
                  if (categoryFocusNode.hasFocus) {
                    ref.read(postViewModelProvider.notifier).setIsEditingCategory(true);
                  } else {
                    ref.read(postViewModelProvider.notifier).setIsEditingCategory(false);
                  }
                });
                List<Widget> columnChildren = [];
                if (!(ref.watch(postViewModelProvider).isEditingCategory || ref.watch(postViewModelProvider).isEditingMethod)) {
                  columnChildren.addAll([
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Place',
                      ),
                      controller: ref.read(postViewModelProvider.notifier).placeController,
                      validator: (value) => value == null || value.isEmpty ? '場所を入力してください' : null,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: LayoutBuilder(builder: (context, constraints) {
                            return TextFormField(
                              key: placeFormKey,
                              decoration: const InputDecoration(
                                labelText: 'Date',
                              ),
                              controller: ref.watch(postViewModelProvider.notifier).dateController,
                              readOnly: true,
                              onTap: () async {
                                DateTime? picked = await showDatePicker(
                                  context: context,
                                  firstDate: DateTime(2020),
                                  lastDate: DateTime(2100),
                                );
                                if (picked != null) {
                                  ref.read(postViewModelProvider.notifier).changeDate(picked);
                                }
                              },
                            );
                          }),
                        ),
                        Text('Week: ${ref.watch(postViewModelProvider).week}'),
                      ],
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Price',
                      ),
                      validator: (String? value) {
                        if (value == null) {
                          return '数字を入力してください';
                        }
                        if (int.tryParse(value) == null) {
                          return '数字を入力してください';
                        }
                        return null;
                      },
                      controller: ref.read(postViewModelProvider.notifier).priceController,
                    ),
                    const VersionLabel(),
                  ]);
                }
                if (ref.watch(postViewModelProvider).isEditingCategory || !(ref.watch(postViewModelProvider).isEditingMethod)) {
                  columnChildren.addAll([
                    TextFormField(
                      focusNode: categoryFocusNode,
                      decoration: const InputDecoration(
                        labelText: 'Category',
                      ),
                      onChanged: (value) => ref.read(postViewModelProvider.notifier).setCategoryQuery(value),
                      controller: ref.read(postViewModelProvider.notifier).categoryController,
                    ),
                  ]);
                }
                if (ref.watch(postViewModelProvider).isEditingMethod || !(ref.watch(postViewModelProvider).isEditingCategory)) {
                  columnChildren.addAll([
                    TextFormField(
                      focusNode: methodFocusNode,
                      key: methodFormKey,
                      decoration: const InputDecoration(
                        labelText: 'Method',
                      ),
                      onChanged: (value) => ref.read(postViewModelProvider.notifier).setMethodQuery(value),
                      controller: ref.read(postViewModelProvider.notifier).methodController,
                    ),
                  ]);
                }
                if (!(ref.watch(postViewModelProvider).isEditingCategory || ref.watch(postViewModelProvider).isEditingMethod)) {
                  columnChildren.addAll([
                    TextFormField(
                      key: otherFormKey,
                      decoration: const InputDecoration(
                        labelText: 'Other',
                      ),
                      controller: ref.read(postViewModelProvider.notifier).otherController,
                    ),
                    Builder(builder: (context) {
                      return TextButton(
                        child: const Text(
                          "ポスト",
                        ),
                        onPressed: () {
                          if (Form.of(context).validate()) {
                            PostModel generated = ref.read(postViewModelProvider.notifier).generatePost();

                            showDialog(
                                context: context,
                                builder: (_) {
                                  return AlertDialog(
                                    title: const Text("ポスト"),
                                    content: Text('title: ${generated.title}\n ${generated.body}'),
                                    actions: [
                                      TextButton(
                                        child: const Text("OK"),
                                        onPressed: () {
                                          ref.read(postViewModelProvider.notifier).addPost(generated, context);
                                          Navigator.pop(context);
                                        },
                                      ),
                                      TextButton(
                                        child: const Text("キャンセル"),
                                        onPressed: () => Navigator.pop(context),
                                      )
                                    ],
                                  );
                                });
                          }
                        },
                      );
                    }),
                    Text(ref.watch(postViewModelProvider).other),
                    Text(ref.watch(postViewModelProvider).errorText, style: const TextStyle(color: Colors.red)),
                    Text(
                        "port:${ref.watch(settingsNotifierProvider).port.toString()} address:${ref.watch(settingsNotifierProvider).serverAddress ?? ''}"),
                    // if (ref.watch(postViewModelProvider).isFocusOnCategory || ref.watch(postViewModelProvider).isFocusOnMethod)
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/home/camera');
                      },
                      child: const Text("画像認識を使う！"),
                    )
                  ]);
                }
                return Form(
                  child: Column(
                    children: columnChildren,
                  ),
                );
              }),
            );
          }),
        ),
        //検索候補
        //TODO カテゴリー選択した時にフォームに反映するようにする
        Consumer(builder: (context, ref, child) {
          List<String> categoryList = ref.watch(postViewModelProvider).categoryList;
          return Padding(
            padding: EdgeInsets.only(top: ref.watch(postViewModelProvider).placeFormOffsetTop + 20),
            child: Container(
              child: (ref.watch(postViewModelProvider).isEditingCategory)
                  ? Container(
                      color: Theme.of(context).colorScheme.background,
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: categoryList.length + 1,
                          itemBuilder: (
                            BuildContext context,
                            int index,
                          ) {
                            if (index == 0) {
                              if (ref.watch(postViewModelProvider).categoryQuery.isNotEmpty &&
                                  categoryList.where((element) => element == ref.watch(postViewModelProvider).categoryQuery).isEmpty) {
                                return TextButton(
                                  onPressed: () {
                                    ref
                                        .read(postViewModelProvider.notifier)
                                        .addToCategoryList(ref.watch(postViewModelProvider).categoryQuery);
                                  },
                                  child: Text('${ref.watch(postViewModelProvider).categoryQuery}を追加'),
                                );
                              } else {
                                return const SizedBox.shrink();
                              }
                            }
                            return Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    ref.read(postViewModelProvider.notifier).changeCategory(categoryList[index]);
                                    ref.read(postViewModelProvider.notifier).setIsEditingCategory(false);
                                  },
                                  child: Text(categoryList[--index]),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () => ref.read(postViewModelProvider.notifier).deleteCategoryList(categoryList[index]),
                                )
                              ],
                            );
                          }),
                    )
                  : null,
            ),
          );
        }),
        Consumer(builder: (context, ref, child) {
          return Padding(
              padding: EdgeInsets.only(top: ref.watch(postViewModelProvider).placeFormOffsetTop),
              child: SizedBox(
                height: 100,
                child: (ref.watch(postViewModelProvider).isEditingMethod) ? const Text('検索候補') : null,
              ));
        }),
        Consumer(builder: (context, ref, child) {
          return TextButton(
            child: const Text("スクロール"),
            onPressed: () => ref.read(postViewModelProvider.notifier).changeScroll(1000),
          );
        }),
      ],
    );
  }

  Widget _dropdownPostItem(String label, DropdownButton dropdownButton, IconButton clearButton) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Text(
            label,
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
        ),
        Row(
          children: [
            dropdownButton,
            clearButton,
          ],
        ),
      ],
    );
  }
}
