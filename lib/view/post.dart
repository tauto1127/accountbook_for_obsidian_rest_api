import 'package:accountbook_for_obsidian_rest_api/view_model/post_view_model.dart';
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
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Date',
                      ),
                      initialValue:
                          ref.watch(postViewModelProvider).date.toString(),
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
                    ),
                  ),
                  Text('Week: ${ref.watch(postViewModelProvider).week}'),
                ],
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Category',
                ),
                initialValue:
                    ref.watch(postViewModelProvider).category.toString(),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Price',
                ),
                initialValue: ref.watch(postViewModelProvider).price.toString(),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Method',
                ),
                initialValue:
                    ref.watch(postViewModelProvider).method.toString(),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Other',
                ),
                initialValue: ref.watch(postViewModelProvider).other.toString(),
              ),
            ],
          );
        }),
      ),
    );
  }
}
