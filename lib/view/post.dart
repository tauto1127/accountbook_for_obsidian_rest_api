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
          )),
      body: SingleChildScrollView(
        child: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return Column(
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
//              TextFormField(
//                decoration: InputDecoration(
//                  labelText: 'Category',
//                ),
//                initialValue:
//                    ref.watch(postViewModelProvider).category.toString(),
//              ),

              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Price',
                ),
                //initialValue: ref.watch(postViewModelProvider).price.toString(),
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
              TextButton(
                child: Text(
                  "ポスト",
                ),
                onPressed: () {
                  ref.read(postViewModelProvider.notifier).generatePost();
                },
              ),
              Text(ref.watch(postViewModelProvider).other),
              Text(
                  "port:${ref.watch(settingsViewModelProvider).port.toString() ?? ""} address:${ref.watch(settingsViewModelProvider).serverAddress ?? ''}"),
            ],
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
