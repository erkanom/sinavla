import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sinavla/views/LoginPage.dart';

class FirebaseInit extends StatefulWidget {
  FirebaseInit({Key key}) : super(key: key);

  @override
  _FirebaseInitState createState() => _FirebaseInitState();
}

class _FirebaseInitState extends State<FirebaseInit> {
  //default values
  bool _initialize = false;
  bool _error = false;

  //for initilazing flutter core
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialize = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Show error message if initialization failed
    if (_error) {
      //return SomethingWentWrong();
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialize) {
      return Center(child: CircularProgressIndicator());
    }

    return LoginPage();
  }
}
