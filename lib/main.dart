import 'package:accountbook_for_obsidian_rest_api/view/post.dart';
import 'package:accountbook_for_obsidian_rest_api/view/setting.dart';
import 'package:accountbook_for_obsidian_rest_api/view/signup.dart';
import 'package:accountbook_for_obsidian_rest_api/view/splash.dart';
import 'package:accountbook_for_obsidian_rest_api/view/template_editor.dart';
import 'package:accountbook_for_obsidian_rest_api/notifier/settings_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  runApp(
    ProviderScope(
      child: MaterialApp(routes: <String, WidgetBuilder>{
        '/': (BuildContext context) {
          return const Splash();
        },
        '/home': (BuildContext context) => Builder(
              builder: (BuildContext context) {
                return Consumer(
                  builder:
                      (BuildContext context, WidgetRef ref, Widget? child) {
                    if (ref.watch(settingsNotifierProvider).token == null ||
                        ref.watch(settingsNotifierProvider).serverAddress ==
                            null) {
                      return const SignUpWidget();
                    } else {
                      return const Post();
                    }
                  },
                );
              },
            ),
        'template_editor': (context) => const TemplateEditor(),
        'settings': (context) => const Setting(),
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
              changeSettingWidget(),
              Text(ref.watch(settingsNotifierProvider).token ?? 'null'),
              const Text("aiueo"),
              TextButton(
                child: const Text("推して"),
                onPressed: () {},
              )
            ],
          );
        }),
      ),
    );
  }

  Widget changeSettingWidget() {
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
              ref.read(settingsNotifierProvider.notifier).setToken(value);
              ref.read(settingsNotifierProvider.notifier).saveServerSettings();
            },
            child: const Text('Save token'),
          );
        }),
      ],
    );
  }
}
