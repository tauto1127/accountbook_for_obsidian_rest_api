import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class ReceiptReader extends StatefulWidget {
  const ReceiptReader({Key? key}) : super(key: key);

  @override
  State<ReceiptReader> createState() => _ReceiptReaderState();
}

class _ReceiptReaderState extends State<ReceiptReader> {
  late CameraController controller;
  late List<CameraDescription> _cameras;
  String? errorText;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Future<void> initState() async {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    try {
      print("カメラとる");
      _cameras = await availableCameras();
      print("カメラ取得終わった");
    } catch (e) {
      errorText = e.toString();
    }
    controller = CameraController(
      _cameras[0],
      ResolutionPreset.high,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Receipt Reader'),
        ),
        body: (controller.value.isInitialized) ? const SizedBox.shrink() : CameraPreview(controller));
  }
}
