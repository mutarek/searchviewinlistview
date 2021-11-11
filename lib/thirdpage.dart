import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      height: 150,
                      width: 180.0,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Center(child: Text('Picture')),
                          ),
                          Expanded(
                            flex: 2,
                            child: Center(child: Text('Text')),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 150,
                    width: 180.0,
                    color: Colors.amber,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Center(child: Text('Picture')),
                        ),
                        Expanded(
                          flex: 2,
                          child: Center(child: Text('Text')),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
