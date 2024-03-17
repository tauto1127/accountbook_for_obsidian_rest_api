import 'package:accountbook_for_obsidian_rest_api/view/post.dart';
import 'package:accountbook_for_obsidian_rest_api/view_model/settings_view_model.dart';
import 'package:accountbook_for_obsidian_rest_api/view_model/template_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProviderContainer container = ProviderScope.containerOf(context);
    return Scaffold(
        body: FutureBuilder(
      future: _initializeSettings(container),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            WidgetsBinding.instance.addPostFrameCallback(
                (timeStamp) => Navigator.of(context).pushNamed('/home'));
            return const SizedBox.shrink();
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    ));
  }

  Future<void> _initializeSettings(ProviderContainer container) async {
    await Future.delayed(const Duration(seconds: 1));
    await container.read(settingsViewModelProvider.notifier).loadSettings();
    await container.read(templateNotifierProvider.notifier).loadTemplate();
  }
}
