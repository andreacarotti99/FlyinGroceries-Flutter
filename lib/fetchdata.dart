import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong/latlong.dart';



class PageList extends StatefulWidget {
  @override
  _PageListState createState() => _PageListState();
}

class _PageListState extends State<PageList> {

  List data;
  List usersData;

  getUsers() async {
    http.Response response = await http.get('https://volospesa-server.herokuapp.com/api/v1/messages');
    debugPrint(response.body);
    data = json.decode(response.body);
    setState(() {
      usersData = data;
    });
  }

  getMarkers() async {
    List allMarkers = [];
    http.Response response = await http.get('https://volospesa-server.herokuapp.com/api/v1/messages');
    data = json.decode(response.body);
    setState(() {
      usersData = data;
    });
    for (int i = 0; i < usersData.length; i++) {
    allMarkers.add(
      new Marker(
        width: 45.0,
        height: 45.0,
        point: new LatLng(usersData[i]["latitudine"], usersData[i]["longitudine"]),
        builder: (context) => new Container(
          child: IconButton(
            icon: Icon(Icons.location_on),
            color: Colors.blue,
            iconSize: 45.0,
            onPressed: () {
              print('Marker tapped');
            },
          ),
        )
      )
    );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsers();
    getMarkers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: usersData == null ? 0 : usersData.length,
        itemBuilder: (BuildContext context, int index) {
          return Card (
            child: Row(
              children: <Widget>[
              Text("${usersData[index]["_id"]}")
              ]
            )
          );
        },
      )
    );
  }
}
