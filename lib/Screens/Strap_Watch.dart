import 'package:flutter/material.dart';

class Strap_Watch extends StatefulWidget {
  const Strap_Watch({Key? key}) : super(key: key);

  @override
  State<Strap_Watch> createState() => _Strap_WatchState();
}

class _Strap_WatchState extends State<Strap_Watch> {
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
              padding: EdgeInsets.only(top: 200),
              child: ListTile(
                title: Text("Analog Watch"),
                leading: Image.network(
                    'https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/71n+z2maVIL._AC_SL1500_.jpg'),
                onTap: () {
                  Navigator.of(context).pushNamed('/');
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: ListTile(
                title: Text("Strap Watch"),
                leading: Image.network(
                    'https://d2d22nphq0yz8t.cloudfront.net/88e6cc4b-eaa1-4053-af65-563d88ba8b26/https://media.croma.com/image/upload/v1680533607/Croma%20Assets/Communication/Wearable%20Devices/Images/262576_zbadss.png/mxw_640,f_auto'),
                onTap: () {
                  // Navigator.of(context).pushNamed('/Strap');
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: ListTile(
                title: Text("Digital Watch"),
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
        title: Text(
          "Strap Watch",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Stack(
          children: [
            Transform.scale(
              scale: 8,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.pinkAccent,
                value: s / 60,
              ),
            ),
            Transform.scale(
              scale: 6,
              child: CircularProgressIndicator(
                strokeWidth: 5,
                color: Colors.greenAccent,
                value: DateTime.now().minute / 60,
              ),
            ),
            Transform.scale(
              scale: 4,
              child: CircularProgressIndicator(
                strokeWidth: 8,
                color: Colors.teal,
                value: h / 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
