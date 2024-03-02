import 'package:accountbook_for_obsidian_rest_api/view_model/signup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Flexible(
                  flex: 3,
                  child: Consumer(builder:
                      (BuildContext context, WidgetRef ref, Widget? child) {
                    return TextField(
                        controller: ref
                            .watch(signupViewModelProvider.notifier)
                            .serverAddressController,
                        decoration: const InputDecoration(
                          labelText: 'ServerAddress',
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1),
                          ),
                        ),
                        onChanged: (String str) {
                          ref.watch(signupViewModelProvider.notifier);
                        });
                  }),
                ),
                Flexible(
                    flex: 1,
                    child: Consumer(builder:
                        (BuildContext context, WidgetRef ref, Widget? child) {
                      return TextField(
                        controller: ref
                            .watch(signupViewModelProvider.notifier)
                            .portController,
                        decoration: InputDecoration(
                          labelText: 'Port',
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1),
                          ),
                          errorText:
                              ref.watch(signupViewModelProvider).portHintText,
                        ),
                        onChanged: (String str) => ref
                            .read(signupViewModelProvider.notifier)
                            .checkPortText(str),
                      );
                    })),
              ],
            ),
            const SizedBox(height: 10),
            Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
              return TextField(
                controller:
                    ref.watch(signupViewModelProvider.notifier).tokenController,
                decoration: const InputDecoration(
                  labelText: 'Token',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1),
                  ),
                ),
              );
            }),
            const SizedBox(
              height: 50,
            ),
            Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
              return TextButton(
                  child: const Text("Proceed"),
                  onPressed: () {
                    ref
                        .read(signupViewModelProvider.notifier)
                        .checkConnection();
                  });
            }),
            Consumer(
              builder: (context, ref, child) => Text(
                ref.watch(signupViewModelProvider).hintText ?? "",
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
