import 'package:accountbook_for_obsidian_rest_api/view_model/settings_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
          if (ref.watch(settingsViewModelProvider).isOk == true) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) => Navigator.of(context).pop());
          }
          return Form(
            child: Column(children: <Widget>[
              TextFormField(
                controller: ref.read(settingsViewModelProvider.notifier).tokenController,
                decoration: const InputDecoration(
                  labelText: 'Token',
                ),
              ),
              TextFormField(
                controller: ref.read(settingsViewModelProvider.notifier).serverAddressController,
                decoration: const InputDecoration(
                  labelText: 'Server Address',
                ),
                validator: (String? value) {
                  if (value == null || Uri.tryParse(value) == null) {
                    return "invalid url";
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: ref.read(settingsViewModelProvider.notifier).portController,
                decoration: const InputDecoration(
                  labelText: 'Port',
                ),
                validator: (String? value) {
                  if (value == null || int.tryParse(value) == null) {
                    return "invalid port";
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: ref.read(settingsViewModelProvider.notifier).rootPathController,
                decoration: const InputDecoration(
                  labelText: 'Root Path',
                ),
              ),
              if (ref.watch(settingsViewModelProvider).isLoading)
                const CircularProgressIndicator()
              else
                Builder(builder: (context) {
                  return TextButton(
                    onPressed: () {
                      if (Form.of(context).validate()) {
                        ref.read(settingsViewModelProvider.notifier).saveSettings();
                      }
                    },
                    child: const Text('Ok'),
                  );
                }),
              Text(ref.watch(settingsViewModelProvider).errorMessage, style: const TextStyle(color: Colors.red)),
            ]),
          );
        }));
  }
}
