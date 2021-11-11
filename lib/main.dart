import 'package:flutter/material.dart';
import 'package:list/secondpage.dart';

import 'datas/dumdata.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: FirstPage()));
}

class FirstPage extends StatefulWidget {
  _State createState() => _State();
}

class _State extends State<FirstPage> {
  final List<Map<String, dynamic>> allUsers = dummyUsers;
  List<Map<String, dynamic>> copyUsers = [];

  @override
  void initState() {
    allUsers.sort();
    copyUsers = allUsers;
    super.initState();
  }

  void searchData(String value) {
    List<Map<String, dynamic>> similarUsers = [];
    if (value.isEmpty) {
      allUsers.sort();
      similarUsers = allUsers;
    } else {
      similarUsers = allUsers.where((name) => name['name'].toLowerCase().contains(value.toLowerCase())).toList();
    }
    setState(() {
      copyUsers = similarUsers;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        drawer: Drawer(
          child: ListTile(
            title: Text('Second'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecondPage()));
            },
          ),
        ),
        appBar: AppBar(title: Text('Search View')),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Search Student'),
                  onChanged: (value) => searchData(value),
                ),
                Container(
                    height: 500,
                    width: double.infinity,
                    child: copyUsers.isNotEmpty
                        ? ListView.builder(
                            itemCount: copyUsers.length,
                            itemBuilder: (ctx, index) {
                              return Card(
                                elevation: 5,
                                color: Colors.amber,
                                child: Container(
                                    height: 130,
                                    width: double.infinity,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Center(
                                            child: CircleAvatar(radius: 60, backgroundColor: Colors.brown, backgroundImage: NetworkImage(copyUsers[index]['profile'])),
                                          ),
                                        ),
                                        Expanded(
                                            flex: 3,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Center(
                                                  child: Text(
                                                    copyUsers[index]['name'],
                                                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                                Text(
                                                  copyUsers[index]['email'],
                                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                                ),
                                                CircleAvatar(backgroundColor: Colors.teal, radius: 20, child: Text("${copyUsers[index]['position']}"))
                                              ],
                                            ))
                                      ],
                                    )),
                              );
                            },
                          )
                        : Image.network("https://pictures.dealer.com/a/alanjayautomotivenetwork/0193/dfdcaf5815f36d2398fb372b2f294a73x.jpg?impolicy=downsize&w=568"))
              ],
            ),
          ),
        ));
  }
}
