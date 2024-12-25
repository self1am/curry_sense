import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:async';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  runApp(FoodRecognitionApp(camera: cameras.first));
}

class FoodRecognitionApp extends StatelessWidget {
  final CameraDescription camera;

  const FoodRecognitionApp({super.key, required this.camera});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        // High contrast theme for better visibility
        brightness: Brightness.light,
      ),
      home: FoodRecordingScreen(camera: camera),
    );
  }
}

class FoodRecordingScreen extends StatefulWidget {
  final CameraDescription camera;

  const FoodRecordingScreen({super.key, required this.camera});

  @override
  FoodRecordingScreenState createState() => FoodRecordingScreenState();
}

class FoodRecordingScreenState extends State<FoodRecordingScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  bool isRecording = false;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.high,
      enableAudio: true,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _startVideoRecording() async {
    try {
      await _controller.startVideoRecording();
      setState(() {
        isRecording = true;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> _stopVideoRecording() async {
    try {
      final file = await _controller.stopVideoRecording();
      setState(() {
        isRecording = false;
      });
      // Here you would typically send the video file for processing
      // and get back the food recognition results
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Food Recognition',
          style: TextStyle(fontSize: 24), // Larger text for better visibility
        ),
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                Expanded(
                  child: CameraPreview(_controller),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (isRecording) {
                            _stopVideoRecording();
                          } else {
                            _startVideoRecording();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(20),
                          minimumSize: const Size(200, 60), // Larger button for easier access
                        ),
                        child: Text(
                          isRecording ? 'Stop Recording' : 'Start Recording',
                          style: const TextStyle(fontSize: 20), // Larger text
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}