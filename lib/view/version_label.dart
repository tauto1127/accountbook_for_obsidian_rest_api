import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:yaml/yaml.dart';

class VersionLabel extends StatelessWidget {
  const VersionLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: rootBundle.loadString('pubspec.yaml'),
        builder: (context, snapshot) {
          String version = "Unknown";
          if (snapshot.hasData) {
            var yaml = loadYaml(snapshot.data!);
            version = yaml["version"];
          }
          return Text("Version: $version");
        });
  }
}
