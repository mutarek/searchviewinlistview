import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(new MaterialApp(
    home: new ThirdPage(),
  ));
}

class ThirdPage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<ThirdPage> {
  List users = [];
  bool loading = false;

  Future<String> getUsers() async {
    setState(() => this.loading = true);
    var response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    setState(() => users = json.decode(response.body.toString()));
    setState(() => this.loading = false);
    return 'success';
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    this.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('REST API'),
      ),
      body: new Column(
        children: <Widget>[
          this.loading
              ? new Center(
                  child: new CircularProgressIndicator(),
                  heightFactor: 12.0,
                )
              : new Expanded(
                  child: new ListView.builder(
                      itemCount: users == null ? 0 : users.length,
                      itemBuilder: (BuildContext context, int index) {
                        var name = users[index]['name'];
                        var email = users[index]['email'];
                        var listaddress =users[index]['address']['city'];

                        return new Column(
                          children: <Widget>[
                            new ListTile(
                              leading: CircleAvatar(
                                child: new Icon(Icons.account_box),
                              ),
                              title: Text(name+listaddress),
                              subtitle: Text(email),
                            ),
                            new Divider(),
                          ],
                        );
                      }),
                ),
        ],
      ),
    );
  }
}
