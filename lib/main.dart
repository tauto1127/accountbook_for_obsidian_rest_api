import 'package:accountbook_for_obsidian_rest_api/view_model/settings_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => Builder(
              builder: (BuildContext context) {
                return Consumer(
                  builder:
                      (BuildContext context, WidgetRef ref, Widget? child) {
                    if (ref.watch(settingsViewModelProvider).token == null) {
                      return const Scaffold(
                        body: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else {
                      return const MyApp();
                    }
                  },
                );
              },
            ),
      }),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return Column(
            children: [
              ChangeSettingWidget(),
              Text(ref.watch(settingsViewModelProvider).token ?? 'null'),
              const Text("aiueo"),
              TextButton(
                child: Text("推して"),
                onPressed: () {},
              )
            ],
          );
        }),
      ),
    );
  }

  Widget ChangeSettingWidget() {
    String value = "";
    return Column(
      children: [
        TextFormField(
          onChanged: (String str) {
            // Update the token
            value = str;
          },
        ),
        Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return ElevatedButton(
            onPressed: () async {
              // Save the token
              ref.read(settingsViewModelProvider.notifier).setToken(value);
              ref.read(settingsViewModelProvider.notifier).saveSettings();
            },
            child: const Text('Save token'),
          );
        }),
      ],
    );
  }
}
