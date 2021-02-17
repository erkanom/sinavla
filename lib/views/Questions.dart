import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sinavla/utils/database_helper.dart';

class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final dbHelper = DatabaseHelper.instance;
  var _arr = [];
  @override
  void initState() {
    super.initState();
    _arr.clear();
    _query();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _arr.length == 0
          ? Center(child: CircularProgressIndicator())
          : Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.height,
              child: Expanded(
                child: ListView.builder(
                    itemCount: _arr.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      int begin = _arr[index].indexOf('Path:');
                      int end = _arr[index].length;
                      String path = _arr[index].substring(begin + 5, end - 1);
                      path = path.trim();
                      print(path);
                      File file = File(path);
                      return Container(child: new Image.file(file));
                    }),
              ),
            ),
    );
  }

  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('query all rows:');
    allRows.forEach((row) => print(row.toString()));
    setState(() {
      allRows.forEach((row) => _arr.add(row.toString()));
    });
  }
}
