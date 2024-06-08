import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class ReceiptReader extends StatefulWidget {
  const ReceiptReader({Key? key}) : super(key: key);

  @override
  State<ReceiptReader> createState() => _ReceiptReaderState();
}

class _ReceiptReaderState extends State<ReceiptReader> {
  CameraController? controller;
  List<CameraDescription>? _cameras;
  String? errorText;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Future<void> initializeCamera() async {
    WidgetsFlutterBinding.ensureInitialized();
    try {
      print("カメラとる");
      _cameras = await availableCameras();
      print("カメラ取得終わった");
    } catch (e) {
      errorText = e.toString();
      print(e);
      return;
    }
    if (_cameras!.isNotEmpty) {
      print("isnotempty");
      controller = CameraController(
        _cameras![0],
        ResolutionPreset.high,
      );
      await controller?.initialize();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null) initializeCamera();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Receipt Reader'),
        ),
        body: Column(
          children: [
            if (errorText != null) Text(errorText.toString()),
            if (controller != null)
              Column(
                children: [
                  Text("カメラきた"),
                  CameraPreview(controller!),
                ],
              )
          ],
        ));
  }
}
