import 'package:accountbook_for_obsidian_rest_api/view_model/post_view_model.dart';
import 'package:accountbook_for_obsidian_rest_api/view_model/settings_view_model.dart';
import 'package:accountbook_for_obsidian_rest_api/view_model/template_notifier.dart';
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
            IconButton(
              icon: Icon(Icons.computer),
              onPressed: () {
                Navigator.of(context).pushNamed('signup');
              },
            ),
          ]),
      body: SingleChildScrollView(
        child: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return Form(
            child: Column(
              children: [
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
                  decoration: InputDecoration(
                    labelText: 'Price',
                  ),
                  validator: (String? value) {
                    print("price" +
                        ref
                            .read(postViewModelProvider.notifier)
                            .priceController
                            .text);
                    print("validate");
                    print(value);
                    if (value == null) {
                      return '数字を入力してください';
                    }
                    if (int.tryParse(value) == null) {
                      print("数字を入力してください");
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
                          .watch(settingsViewModelProvider)
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
                      icon: Icon(Icons.clear),
                      onPressed: () => ref
                          .read(postViewModelProvider.notifier)
                          .changeCategory(null),
                    )),
                _dropdownPostItem(
                    "Method",
                    DropdownButton(
                        value: ref.watch(postViewModelProvider).method,
                        items: ref
                            .watch(settingsViewModelProvider)
                            .method!
                            .map((String str) => DropdownMenuItem(
                                  child: Text(str),
                                  value: str,
                                ))
                            .toList(),
                        onChanged: (value) => ref
                            .read(postViewModelProvider.notifier)
                            .changeMethod(value)),
                    IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () => ref
                          .read(postViewModelProvider.notifier)
                          .changeMethod(null),
                    )),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Other',
                  ),
                  controller:
                      ref.read(postViewModelProvider.notifier).otherController,
                ),
                Builder(builder: (context) {
                  return TextButton(
                    child: Text(
                      "ポスト",
                    ),
                    onPressed: () {
                      if (Form.of(context)!.validate()) {
                        String generated = ref
                            .read(postViewModelProvider.notifier)
                            .generatePost();

                        showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                title: Text("ポスト"),
                                content: Text(generated),
                                actions: [
                                  TextButton(
                                    child: Text("OK"),
                                    onPressed: () {
                                      ref
                                          .read(postViewModelProvider.notifier)
                                          .addPost(generated, context);
                                      Navigator.pop(context);
                                    },
                                  ),
                                  TextButton(
                                    child: Text("キャンセル"),
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
                    "port:${ref.watch(settingsViewModelProvider).port.toString() ?? ""} address:${ref.watch(settingsViewModelProvider).serverAddress ?? ''}"),
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
            style: TextStyle(
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
