import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:yaml/yaml.dart';

class VersionLabel extends StatelessWidget {
  const VersionLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: rootBundle.loadString("pubspec.yaml"),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          String version = "Unknown";
          if (snapshot.hasData) {
            var yaml = loadYaml(snapshot.data!);
            version = yaml["version"];
            return Text("Version: $version");
          }
          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }
          return Text(version);
        });
  }
}
