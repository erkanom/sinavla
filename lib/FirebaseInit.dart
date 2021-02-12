import 'package:flutter/material.dart';
import 'package:sinavla/views/LoginPage.dart';

class FirebaseInit extends StatefulWidget {
  FirebaseInit({Key key}) : super(key: key);

  @override
  _FirebaseInitState createState() => _FirebaseInitState();
}

class _FirebaseInitState extends State<FirebaseInit> {
  @override
  Widget build(BuildContext context) {
    return LoginPage();
  }
}
