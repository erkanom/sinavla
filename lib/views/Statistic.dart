import 'package:flutter/material.dart';
import 'package:sinavla/widgets/bottomNav.dart';

class StatisticPage extends StatelessWidget {
  const StatisticPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
