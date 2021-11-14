import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'datas/dumdata.dart';
import 'datas/grocerycollection.dart';
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
              height: 400,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: vegetables.length,
                itemBuilder: (ctx, index) {
                  return GestureDetector(
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        height: 150,
                        width: 150,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Stack(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        vegetables[index]['picture'],
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: 150,
                                      )),
                                  Positioned(
                                    top: 1,
                                    left: 1,
                                    child: Container(
                                      height: 30,
                                      width: 50,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(10)), color: Colors.blue),
                                      child: Center(
                                        child: Text(
                                          vegetables[index]['price'].toString(),
                                          style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 1,
                                    right: 1,
                                    child: Container(
                                      height: 30,
                                      width: 50,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(10)), color: Colors.amber),
                                      child: Center(
                                        child: Text(
                                          vegetables[index]['price'].toString(),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Center(
                                      child: Text(vegetables[index]['name']),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Center(
                                      child: Icon(Icons.shopping_cart),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(4),
              padding: EdgeInsets.all(5),
              height: 40,
              width: double.infinity,
              child: Text(
                'Grocery Collection',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, letterSpacing: 3),
              ),
            ),
            Container(
              height: 200,
              width: double.infinity,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                scrollDirection: Axis.horizontal,
                itemCount: vegetables.length,
                itemBuilder: (ctx, index) {
                  return GestureDetector(
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        height: 150,
                        width: 150,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Stack(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        vegetables[index]['picture'],
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: 150,
                                      )),
                                  Positioned(
                                    top: 1,
                                    left: 1,
                                    child: Container(
                                      height: 30,
                                      width: 50,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(10)), color: Colors.blue),
                                      child: Center(
                                        child: Text(
                                          vegetables[index]['price'].toString(),
                                          style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 1,
                                    right: 1,
                                    child: Container(
                                      height: 30,
                                      width: 50,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(10)), color: Colors.amber),
                                      child: Center(
                                        child: Text(
                                          vegetables[index]['price'].toString(),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Center(
                                      child: Text(vegetables[index]['name']),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Center(
                                      child: Icon(Icons.shopping_cart),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
