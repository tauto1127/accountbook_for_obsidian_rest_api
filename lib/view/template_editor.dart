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
        actions: [
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              return IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () => ref.read(templateViewModelProvider.notifier).reset(),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Flexible(
            flex: 9,
            child: Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
              return TextField(
                expands: true,
                minLines: null,
                maxLines: null,
                textAlignVertical: TextAlignVertical.top,
                onChanged: (value) => ref.read(templateViewModelProvider.notifier).resetErrorText(),
                controller: ref.watch(templateViewModelProvider.notifier).templateTextFieldController,
                decoration: InputDecoration(
                  labelText: 'Template',
                  errorText: ref.watch(templateViewModelProvider).errorText,
                  border: const OutlineInputBorder(
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
              child: Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
                return TextButton(
                  onPressed: () {
                    ref.read(templateViewModelProvider.notifier).saveTemplate();
                    Navigator.of(context).pop();
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
