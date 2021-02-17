import 'dart:io';
import 'package:edge_detection/edge_detection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sinavla/widgets/bottomNav.dart';
import 'package:sinavla/utils/database_helper.dart';
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

  final dbHelper = DatabaseHelper.instance;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: imageNew == null
                  ? Container(
                      child: Text('Image Not Found'),
                    )
                  : imageNew),
          FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => {
                    _insert(),
                  }),
          //RaisedButton(onPressed: () => {_deleteAll()}),
          //RaisedButton(onPressed: () => {_query()}),
          Expanded(child: BottomNavBar()),
        ],
      ),
    );
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

  void _insert() async {
    // row to insert
    Map<String, dynamic> row = {
      'lesson': 'Sinavla',
      'topic': 'Sinavla',
      'path': '$_imagePath'
    };
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
  }

  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('query all rows:');
    allRows.forEach((row) => print(row));
  }

  void _delete(String path) async {
    final rowsDeleted = await dbHelper.delete(path);
    file = File(path);
    file.delete();
    print('deleted $rowsDeleted row(s): row 1');
  }

  void _deleteAll() async {
    final rowsDeleted = await dbHelper.deleteAll();
  }
}
