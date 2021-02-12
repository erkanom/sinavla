import 'package:flutter/material.dart';
import 'package:sinavla/widgets/bottomNav.dart';

class SoruPage extends StatelessWidget {
  const SoruPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
