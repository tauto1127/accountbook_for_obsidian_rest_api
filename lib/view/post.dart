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
      body: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return Column(
          children: [
            Text(ref.watch(templateNotifierProvider)),
          ],
        );
      }),
    );
  }
}
