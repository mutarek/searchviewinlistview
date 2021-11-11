import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'datas/dumdata.dart';
import 'datas/vegetables.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(4),
              padding: EdgeInsets.all(5),
              height: 60,
              width: double.infinity,
              child: Text(
                'Take a look of our some fresh vegetables ',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, letterSpacing: 3),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 200,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: vegetables.length,
                itemBuilder: (contezt, index) {
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                    child: Container(
                      height: 130,
                      width: 150,
                      child: Column(
                        children: [
                          Expanded(
                              flex: 3,
                              child: Stack(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        vegetables[index]['picture'],
                                        fit: BoxFit.cover,
                                        width: 150,
                                      )),
                                  Positioned(
                                      top: 20,
                                      left: 1,
                                      child: Container(
                                        height: 10,
                                        width: 10,
                                        color: Colors.white,
                                        child: Center(
                                          child: Text('40'),
                                        ),
                                      ))
                                ],
                              )),
                          Expanded(
                            flex: 2,
                            child: Center(
                              child: Text(
                                vegetables[index]['name'],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 400,
              width: double.infinity,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 
                ),
                itemCount: vegetables.length,
                itemBuilder: (contezt, index) {
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                    child: Container(
                      height: 130,
                      width: 150,
                      child: Column(
                        children: [
                          Expanded(
                              flex: 3,
                              child: Stack(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        vegetables[index]['picture'],
                                        fit: BoxFit.cover,
                                        width: 150,
                                      )),
                                  Positioned(
                                      top: 20,
                                      left: 1,
                                      child: Container(
                                        height: 10,
                                        width: 10,
                                        color: Colors.white,
                                        child: Center(
                                          child: Text('40'),
                                        ),
                                      ))
                                ],
                              )),
                          Expanded(
                            flex: 2,
                            child: Center(
                              child: Text(
                                vegetables[index]['name'],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
