import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong/latlong.dart';
import 'package:VoloSpesa/fetchdata.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class MapPage extends StatefulWidget {
  @override
  MapPageState createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  List <Marker> allMarkers = [];
  List data;
  List usersData;
  //Completer<GoogleMapController> _controller = Completer();
  getMarkers() async {
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
    super.initState();
    getMarkers();

  }
    double zoomVal=5.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildMapBox(context),
          _buildContainer(),
        ],
      ),
    );
  }

  Widget _buildMapBox(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
        child: new FlutterMap(
          options: new MapOptions(
              center: new LatLng(45.4670, 9.1815), zoom: 13.0),
          layers: [
            new TileLayerOptions(
                urlTemplate:
                    "https://api.mapbox.com/styles/v1/andreacarotti/ck8ndy79206g91io8jhmrh20f/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYW5kcmVhY2Fyb3R0aSIsImEiOiJjazhuZHBlbDcwYWgzM2ZwaTVsc3Jnbm1jIn0.IgBj1EEumtK3lTtVOP7nsA",
                additionalOptions: {
                  'accessToken':
                      'pk.eyJ1IjoiYW5kcmVhY2Fyb3R0aSIsImEiOiJjazhuZHV4dHgwb3NlM2xvazcyMmZmNGM1In0.muRvmaS2sErXg8cZ3GPebA',
                  'id': 'mapbox.mapbox-streets-v7'
                }
            ),
            new MarkerLayerOptions(
              markers: allMarkers
            )

          ]
        )
    );
  }
 
  
  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipO3VPL9m-b355xWeg4MXmOQTauFAEkavSluTtJU=w225-h160-k-no",
                  40.738380, -73.988426,"Gramercy Tavern"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipMKRN-1zTYMUVPrH-CcKzfTo6Nai7wdL7D8PMkt=w340-h160-k-no",
                  40.761421, -73.981667,"Le Bernardin"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://images.unsplash.com/photo-1504940892017-d23b9053d5d4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                  40.732128, -73.999619,"Blue Hill"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxes(String _image, double lat,double long,String boomerName) {
    return  GestureDetector(
        onTap: () {
          //_gotoLocation(lat,long);
        },
        child:Container(
              child: new FittedBox(
                child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Colors.grey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 180,
                          height: 200,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(24.0),
                            child: Image(
                              fit: BoxFit.fill,
                              image: NetworkImage(_image),
                            ),
                          )
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: myDetailsContainer1(boomerName),
                          ),
                        ),

                      ],)
                ),
              ),
            ),
    );
  }

  Widget myDetailsContainer1(String boomerName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(boomerName,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          )),
        ),
        SizedBox(height:5.0),
        Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  child: Text(
                "4.1",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              )),
               Container(
                  child: Text(
                "(946)",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              )
              ),
            ],
          )),
          SizedBox(height:5.0),
        Container(
                  child: Text(
                "American \u00B7 \u0024\u0024 \u00B7 1.6 mi",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              )),
              SizedBox(height:5.0),
        Container(
            child: Text(
          "Closed \u00B7 Opens 17:00 Thu",
          style: TextStyle(
              color: Colors.black54,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        )),
      ],
    );
  }


/* 
  Future<void> _gotoLocation(double lat,double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat, long), zoom: 15,tilt: 50.0,
      bearing: 45.0,)));
  } */
}
