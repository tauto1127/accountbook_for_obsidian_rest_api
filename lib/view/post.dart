import 'package:accountbook_for_obsidian_rest_api/view_model/post_view_model.dart';
import 'package:accountbook_for_obsidian_rest_api/view_model/settings_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Post extends StatelessWidget {
  const Post({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Post'),
          leading: IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => Navigator.of(context).pushNamed('template_editor'),
          ),
          actions: [
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                return IconButton(
                  icon: const Icon(Icons.computer),
                  onPressed: () 
                    /// whenCompleteがないとsetting画面が残ったまんまになる
                    => Navigator.of(context).pushNamed('settings').whenComplete(() => ref.read(postViewModelProvider))
                );
              }
            ),
          ]),
      body: SingleChildScrollView(
        child: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Place',
                  ),
                  controller:
                      ref.read(postViewModelProvider.notifier).placeController,
                  validator: (value) =>
                      value == null || value.isEmpty ? '場所を入力してください' : null,
                ),
                Row(
                  children: [
                    Flexible(
                      child: LayoutBuilder(builder: (context, constraints) {
                        return TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Date',
                          ),
                          controller: ref
                              .watch(postViewModelProvider.notifier)
                              .dateController,
                          readOnly: true,
                          onTap: () async {
                            DateTime? picked = await showDatePicker(
                              context: context,
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2100),
                            );
                            if (picked != null) {
                              ref
                                  .read(postViewModelProvider.notifier)
                                  .changeDate(picked);
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
                  controller:
                      ref.read(postViewModelProvider.notifier).priceController,
                ),
                _dropdownPostItem(
                    "Category",
                    DropdownButton(
                      value: ref.watch(postViewModelProvider).category,
                      items: ref
                          .watch(settingsNotifierProvider)
                          .category!
                          .map((String value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        ref.read(postViewModelProvider.notifier).changeCategory(
                            value ?? ref.watch(postViewModelProvider).category);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () => ref
                          .read(postViewModelProvider.notifier)
                          .changeCategory(null),
                    )),
                _dropdownPostItem(
                    "Method",
                    DropdownButton(
                        value: ref.watch(postViewModelProvider).method,
                        items: ref
                            .watch(settingsNotifierProvider)
                            .method!
                            .map((String str) => DropdownMenuItem(
                                  value: str,
                                  child: Text(str),
                                ))
                            .toList(),
                        onChanged: (value) => ref
                            .read(postViewModelProvider.notifier)
                            .changeMethod(value)),
                    IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () => ref
                          .read(postViewModelProvider.notifier)
                          .changeMethod(null),
                    )),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Other',
                  ),
                  controller:
                      ref.read(postViewModelProvider.notifier).otherController,
                ),
                Builder(builder: (context) {
                  return TextButton(
                    child: const Text(
                      "ポスト",
                    ),
                    onPressed: () {
                      if (Form.of(context).validate()) {
                        String generated = ref
                            .read(postViewModelProvider.notifier)
                            .generatePost();

                        showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                title: const Text("ポスト"),
                                content: Text(generated),
                                actions: [
                                  TextButton(
                                    child: const Text("OK"),
                                    onPressed: () {
                                      ref
                                          .read(postViewModelProvider.notifier)
                                          .addPost(generated, context);
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
                Text(
                    "port:${ref.watch(settingsNotifierProvider).port.toString()} address:${ref.watch(settingsNotifierProvider).serverAddress ?? ''}"),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _dropdownPostItem(
      String label, DropdownButton dropdownButton, IconButton clearButton) {
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
