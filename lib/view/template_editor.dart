import 'package:accountbook_for_obsidian_rest_api/view_model/template_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TemplateEditor extends StatelessWidget {
  const TemplateEditor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Template Editor'),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 9,
            child: Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
              return TextField(
                expands: true,
                minLines: null,
                maxLines: null,
                controller: ref
                    .watch(templateViewModelProvider.notifier)
                    .templateTextFieldController,
                decoration: const InputDecoration(
                  labelText: 'Template',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                ),
              );
            }),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: SizedBox.expand(
              child: Consumer(builder:
                  (BuildContext context, WidgetRef ref, Widget? child) {
                return TextButton(
                  onPressed: () {
                    ref.read(templateViewModelProvider.notifier).saveTemplate();
                  },
                  style: TextButton.styleFrom(
                    fixedSize: const Size(double.infinity, double.infinity),
                  ),
                  child: const Text("apply"),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
