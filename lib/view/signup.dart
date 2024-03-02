import 'package:accountbook_for_obsidian_rest_api/view_model/signup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
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
                        decoration: InputDecoration(
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
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1),
                          ),
                        ),
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
              return TextButton(child: Text("Proceed"), onPressed: () {});
            })
          ],
        ),
      ),
    );
  }
}
