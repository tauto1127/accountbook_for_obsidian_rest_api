import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Template',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: TextButton(onPressed: () {}, child: Text("button")),
          ),
        ],
      ),
    );
  }
}
