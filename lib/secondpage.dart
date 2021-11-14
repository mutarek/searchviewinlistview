import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:list/thirdpage.dart';

import 'homepage.dart';

class SecondPage extends StatefulWidget {
  _State createState() => _State();
}

class _State extends State<SecondPage> {
  int selectedpage = 1; //initial value
  final _pageOptions = [
    ThirdPage(),
    FirstPage(),
    FirstPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[selectedpage],
      bottomNavigationBar: CurvedNavigationBar(
        index: 1,
        height: 50,
        buttonBackgroundColor: Colors.amber,
        backgroundColor: Colors.white,
        color: Colors.blue,
        animationCurve: Curves.linearToEaseOut,
        items: [
          Icon(Icons.shop, size: 30),
          Icon(Icons.account_balance, size: 40),
          Icon(Icons.compare_arrows, size: 30),
        ],
        onTap: (index) {
          setState(() {
            selectedpage = index; // changing selected page as per bar index selected by the user
          });
        },
      ),
    );
  }
}
