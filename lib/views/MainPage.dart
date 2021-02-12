import 'package:flutter/material.dart';
import 'package:countdown_flutter/countdown_flutter.dart';

import 'package:sinavla/widgets/bottomNav.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime dob = DateTime.parse('2021-06-27');
    Duration dur = dob.difference(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[800],
        title: Text(
          'SINAVLA',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * (5.0 / 30),
            child: Center(
              child: Text(
                'YENİ HAYATINA',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
          ),
          countDown(dur, 0, context),
          SizedBox(
            height: MediaQuery.of(context).size.height * (1.0 / 30),
            child: Text('GÜN'),
          ),
          countDown(dur, 1, context),
          SizedBox(
            height: MediaQuery.of(context).size.height * (1.0 / 30),
            child: Text('SAAT'),
          ),
          countDown(dur, 2, context),
          SizedBox(
            height: MediaQuery.of(context).size.height * (1.0 / 30),
            child: Text('DAKİKA'),
          ),
          countDown(dur, 3, context),
          SizedBox(
            height: MediaQuery.of(context).size.height * (1.0 / 30),
            child: Text('SANİYE'),
          ),
          SizedBox(
            child: Text(
              'KALDI',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: BottomNavBar()),
          ),
        ],
      ),
    );
  }

  countDown(Duration dur, int i, BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 2 / 20,
            decoration:
                BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
          ),
          Center(
            child: Countdown(
              duration: dur,
              builder: (BuildContext ctx, Duration remaining) {
                switch (i) {
                  case 0:
                    return Text(
                      '${remaining.inDays}',
                      style: TextStyle(fontSize: 20),
                    );
                    break;
                  case 1:
                    return Text(
                      '${remaining.inHours % 24}',
                      style: TextStyle(fontSize: 20),
                    );
                    break;
                  case 2:
                    return Text(
                      '${remaining.inMinutes % 60}',
                      style: TextStyle(fontSize: 20),
                    );
                  case 3:
                    return Text(
                      '${remaining.inSeconds % 60}',
                      style: TextStyle(fontSize: 20),
                    );
                    break;
                  default:
                    return null;
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
