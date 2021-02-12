import 'package:flutter/material.dart';
import 'package:sinavla/models/NavIndex.dart';
import 'package:sinavla/views/MainPage.dart';
import 'package:sinavla/views/SoruPage.dart';
import 'package:provider/provider.dart';
import 'package:sinavla/views/Statistic.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex;
  initState() {
    super.initState();
    this._selectedIndex = context.read<NavIndex>().index;
  }

  void _onItemTapped(int index) {
    setState(() {
      if (index == 0) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => MainPage()));
      }
      if (index == 1) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => SoruPage()));
      }
      if (index == 2) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => StatisticPage()));
      }
      Provider.of<NavIndex>(context, listen: false).changeIndex(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Ana sayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Soru Ekle',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image_search_rounded),
            label: 'Sorular',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
