import 'package:flutter/material.dart';

class Digital_Watch extends StatefulWidget {
  const Digital_Watch({Key? key}) : super(key: key);

  @override
  State<Digital_Watch> createState() => _Digital_WatchState();
}

class _Digital_WatchState extends State<Digital_Watch> {
  int second = 0;
  myClock() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        // if (DateTime.now().hour > 12) {
        //   DateTime.now().hour -= 12;
        // }
        // second++;
        myClock();
      });
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
      appBar: AppBar(
        title: Text(
          "Digital Watch",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
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
                  Navigator.of(context).pushNamed('/Strap');
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
                  // Navigator.of(context).pushNamed('/Digital');
                },
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}",
              style: TextStyle(
                fontSize: 50,
              ),
            ),
            Text(
              "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
              style: TextStyle(
                fontSize: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
