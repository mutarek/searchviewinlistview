import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async' show Future;
import 'dart:convert';
import 'package:http/http.dart' as http;

class FirstPage extends StatefulWidget {
  _State createState() => _State();
}

class _State extends State<FirstPage>{
  List allUsers =[];
  bool isloading = false;

  Future<String> getAllUsers() async{
    setState(()=> this.isloading =true);
    var response = await http.get(Uri.parse('https://api.instantwebtools.net/v1/airlines'));
    setState(()=> allUsers = json.decode(response.body.toString()));
    setState(()=> this.isloading= false);
    return 'success';
  }

  @override
  void initState() {
    getAllUsers();
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Worked'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: this.isloading ? Center(
          child: CircularProgressIndicator(),
          heightFactor: 12.0,
        ): ListView.builder(
          itemCount: allUsers.length,
          itemBuilder: (ctx,index){
            return Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0)
              ),
              child: Container(
                height: 200,
                width: double.infinity,
                child: Column(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Stack(
                        children: [
                          Image.network(allUsers[index]['logo']),
                          Positioned(
                            left: 1,
                            top: 1,
                            child: Text(allUsers[index]['country']),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Text(allUsers[index]['name']),
                                Text(allUsers[index]['slogan']),

                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Text(allUsers[index]['name']),
                                Text(allUsers[index]['website']),
                                Text(allUsers[index]['established']),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

              ),
            );
          },
        )
      ),
    );
  }
}