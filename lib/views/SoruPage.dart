import 'dart:io';
import 'package:edge_detection/edge_detection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sinavla/widgets/bottomNav.dart';
import 'package:opencv/opencv.dart';

class SoruPage extends StatefulWidget {
  const SoruPage({Key key}) : super(key: key);

  @override
  _SoruPageState createState() => _SoruPageState();
}

class _SoruPageState extends State<SoruPage> {
  String _imagePath = 'Unknown';
  File file;
  Image imageNew;
  dynamic res;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String imagePath;

    try {
      imagePath = await EdgeDetection.detectEdge;
    } on PlatformException {
      imagePath = 'Failed to get cropped image path.';
    }

    if (!mounted) return;

    setState(() {
      _imagePath = imagePath;
    });
    processImage();
  }

  Future<void> processImage() async {
    file = File(_imagePath);

    res = await ImgProc.adaptiveThreshold(await file.readAsBytes(), 125,
        ImgProc.adaptiveThreshMeanC, ImgProc.threshBinary, 11, 12);
    setState(() {
      imageNew = Image.memory(res);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: imageNew,
          ),
          Expanded(child: BottomNavBar()),
        ],
      ),
    );
  }
}
