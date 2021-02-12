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
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * (0.5 / 10),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: MediaQuery.of(context).size.height * (1.0 / 10),
                  child: Image.asset('assets/bilkent.png'),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * (1.0 / 20),
                      width: MediaQuery.of(context).size.width / 2,
                      child: Text('Bilkent Universitesi'),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * (1.0 / 20),
                      width: MediaQuery.of(context).size.width / 2,
                      child: Text('Bilgisayar Muhendisligi'),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * (1.0 / 30),
          ),
          countDown(dur, 0, context),
          SizedBox(
            height: MediaQuery.of(context).size.height * (1.0 / 30),
            child: Text('Gun'),
          ),
          countDown(dur, 1, context),
          SizedBox(
            height: MediaQuery.of(context).size.height * (1.0 / 30),
            child: Text('Saat'),
          ),
          countDown(dur, 2, context),
          SizedBox(
            height: MediaQuery.of(context).size.height * (1.0 / 30),
            child: Text('Dakika'),
          ),
          countDown(dur, 3, context),
          SizedBox(
            height: MediaQuery.of(context).size.height * (1.0 / 30),
            child: Text('Saniye'),
          ),
          SizedBox(
            child: Text(
              'KALDI',
              style: TextStyle(fontSize: 30),
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
