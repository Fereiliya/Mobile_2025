import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:kamera_flutter/widget/filter_carousel.dart';

// A screen that allows users to take a picture using a given camera.
class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({super.key, required this.camera});

  final CameraDescription camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> with WidgetsBindingObserver {
  CameraController? _controller;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    // Dispose of any existing controller
    await _controller?.dispose();
    
    if (!mounted) return;

    try {
      final CameraController cameraController = CameraController(
        widget.camera,
        ResolutionPreset.medium,
        enableAudio: false,
        imageFormatGroup: ImageFormatGroup.jpeg,
      );

      _controller = cameraController;

      // Initialize controller
      await cameraController.initialize();
      
      if (!mounted) {
        await cameraController.dispose();
        return;
      }

      // Setup image stream to prevent buffer issues
      await cameraController.startImageStream((image) {
        // Just used to keep the camera stream active and prevent buffer issues
      });

      setState(() => _isCameraInitialized = true);
    } catch (e) {
      print('Error initializing camera: $e');
      _isCameraInitialized = false;
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = _controller;

    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      _initializeCamera();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Take a picture - 2341720083')),
      body: _isCameraInitialized && _controller != null
          ? Container(
              width: double.infinity,
              height: double.infinity,
              child: FittedBox(
                fit: BoxFit.cover,
                child: Container(
                  width: _controller!.value.previewSize?.width ?? 1,
                  height: _controller!.value.previewSize?.height ?? 1,
                  child: CameraPreview(_controller!),
                ),
              ),
            )
          : const Center(child: CircularProgressIndicator()),
      floatingActionButton: FloatingActionButton(
        onPressed: !_isCameraInitialized
            ? null
            : () async {
                try {
                  final controller = _controller;
                  if (controller == null || !controller.value.isInitialized) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Error: Camera not initialized')),
                    );
                    return;
                  }

                  // Stop the image stream before taking a picture
                  await controller.stopImageStream();
                  
                  final image = await controller.takePicture();

                  if (!context.mounted) return;

                  // Restart the image stream after taking the picture
                  await controller.startImageStream((image) {});

                  await Navigator.of(context).push(
                    MaterialPageRoute(
                builder: (context) => PhotoFilterCarousel(
                  imagePath: image.path,
                ),
              ),
            );
          } catch (e) {
            // If an error occurs, log the error to the console.
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
