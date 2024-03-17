import 'package:accountbook_for_obsidian_rest_api/view_model/settings_view_model.dart';
import 'package:accountbook_for_obsidian_rest_api/view_model/template_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Splash extends ConsumerWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _initializeSettings(ref, context);
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  void _initializeSettings(WidgetRef ref, BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    await ref.read(settingsViewModelProvider.notifier).loadSettings();
    await ref.read(templateNotifierProvider.notifier).loadTemplate();
    //TODO FutureBuilderでうまく回避できそう？
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacementNamed('/home');
  }
}
