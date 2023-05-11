// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'dart:math';

class Analog_Watch extends StatefulWidget {
  const Analog_Watch({Key? key}) : super(key: key);

  @override
  State<Analog_Watch> createState() => _Analog_WatchState();
}

class _Analog_WatchState extends State<Analog_Watch> {
  String a = '';
  void DayName() {
    switch (d) {
      case 1:
        a = "MON";
        break;
      case 2:
        a = "TUE";
        break;
      case 3:
        a = "WED";
        break;
      case 4:
        a = "THU";
        break;
      case 5:
        a = "FRI";
        break;
      case 6:
        a = "SAT";
        break;
      case 7:
        a = "SAN";
        break;
    }
  }

  int s = 0;
  int m = 0;
  int h = 0;
  int d = 0;
  int mm = 0;
  myClock() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        s = DateTime.now().second;
        m = DateTime.now().minute;
        h = DateTime.now().hour;
        d = DateTime.now().day;
        mm = DateTime.now().month;
      });
      myClock();
    });
  }

  @override
  void initState() {
    myClock();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 200),
              child: ListTile(
                title: const Text("Analog Watch"),
                leading: Image.network(
                    'https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/71n+z2maVIL._AC_SL1500_.jpg'),
                onTap: () {
                  // Navigator.of(context).pushNamed('/Strap');
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ListTile(
                title: const Text("Strap Watch"),
                leading: Image.network(
                    'https://d2d22nphq0yz8t.cloudfront.net/88e6cc4b-eaa1-4053-af65-563d88ba8b26/https://media.croma.com/image/upload/v1680533607/Croma%20Assets/Communication/Wearable%20Devices/Images/262576_zbadss.png/mxw_640,f_auto'),
                onTap: () {
                  Navigator.of(context).pushNamed('/Strap');
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ListTile(
                title: const Text("Digital Watch"),
                leading: Image.network(
                    'https://m.media-amazon.com/images/I/61MuSYQ7yhL._SX425_.jpg'),
                onTap: () {
                  Navigator.of(context).pushNamed('/Digital');
                },
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text(
          "Analog Watch",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Stack(
          children: [
            // Center(
            //   child: Container(
            //     height: 100,
            //     width: 100,
            //     decoration: BoxDecoration(
            //       color: Colors.blue,
            //       borderRadius: BorderRadius.circular(100),
            //     ),
            //   ),
            // ),
            ...List.generate(
              60,
              (index) => Transform.rotate(
                  angle: (index / 60) * (2 * pi),
                  child: Stack(
                    children: [
                      Divider(
                        thickness: (index % 5 == 0)
                            ? (index % 15 == 0)
                                ? 12
                                : 7
                            : 2,
                        endIndent: MediaQuery.of(context).size.width * 0.90,
                        color: (index % 15 == 0) ? Colors.red : Colors.grey,
                      ),
                      Transform.rotate(
                        angle: (pi * 2),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Transform.scale(
                            scale: 2,
                            child: Text(
                              (index == 0) ? "9" : "",
                              style: const TextStyle(
                                // fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Transform.rotate(
                        angle: (3 * pi / 2),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Transform.scale(
                            scale: 2,
                            child: Text(
                              (index == 15) ? "12" : "",
                              style: const TextStyle(
                                // fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Transform.rotate(
                        angle: (pi),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Transform.scale(
                            scale: 2,
                            child: Text(
                              (index == 30) ? "3" : "",
                              style: const TextStyle(
                                // fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Transform.rotate(
                        angle: (pi / 2),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Transform.scale(
                            scale: 2,
                            child: Text(
                              (index == 45) ? "6" : "",
                              style: const TextStyle(
                                // fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            Transform.rotate(
              angle: (3 * pi / 2),
              child: Transform.rotate(
                angle: (pi * 2) * (s / 60),
                child: Divider(
                  color: Colors.orange,
                  thickness: 2,
                  // endIndent: MediaQuery.of(context).size.width*0.5,
                  indent: MediaQuery.of(context).size.width * 0.5,
                ),
              ),
            ),
            Transform.rotate(
              angle: (3 * pi / 2),
              child: Transform.rotate(
                angle: (pi * 2) * (m / 60),
                child: const Divider(
                  color: Colors.white,
                  thickness: 4,
                  endIndent: 80,
                  indent: 200,
                ),
              ),
            ),
            Transform.rotate(
              angle: (3 * pi / 2),
              child: Transform.rotate(
                angle: (pi * 2) * (h / 12),
                child: const Divider(
                  color: Colors.white,
                  thickness: 6,
                  endIndent: 110,
                  indent: 200,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Text(
                "$d/$mm",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100),
              child: Text(
                a,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
