import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sinavla/FirebaseInit.dart';
import 'package:sinavla/models/NavIndex.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavIndex()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SINAVLA',
      home: FirebaseInit(),
    );
  }
}
