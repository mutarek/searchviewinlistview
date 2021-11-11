import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'datas/dumdata.dart';

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
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dummyUsers.length,
                itemBuilder: (contezt, index) {
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                    child: Container(
                      height: 130,
                      width: 150,
                      child: Column(
                        children: [
                          Expanded(flex: 3, child: ClipRRect(borderRadius: BorderRadius.circular(100), child: Image.network(dummyUsers[index]['profile']))),
                          Expanded(
                            flex: 2,
                            child: Center(
                              child: Text(
                                'Vegetable',
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
