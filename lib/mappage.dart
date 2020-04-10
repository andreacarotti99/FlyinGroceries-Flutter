import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';


class MapPage extends StatefulWidget {
  @override
  MapPageState createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  List <Marker> allMarkers = [];
  List <Widget> allPaddings = [];
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
        width: 74.0,
        height: 74.0,
        point: new LatLng(usersData[i]["latitudine"], usersData[i]["longitudine"]),
        builder: (context) => new Container(
          child: IconButton(
            icon: Image(
              image: new AssetImage("assets/images/oldies.png"),
              
            ),
            color: Colors.blue,
            iconSize: 100.0,
            onPressed: () {
              print('Marker tapped');
              showModalBottomSheet(context: context, backgroundColor: Colors.transparent, builder: (builder){
                
                return Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top + MediaQuery.of(context).padding.bottom,
                  ),
                  child: Material(
                    elevation: 12.0,
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(32.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(height: 8.0),
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Row(
                            children: <Widget>[
                              SizedBox.fromSize(
                                size: Size.fromRadius(32.0),
                                child: Material(
                                  shape: CircleBorder(),
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.asset(
                                    'assets/images/oldies.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 16.0),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      usersData[i]["nome"],
                                      style: TextStyle(
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text('Consegnagli adesso la spesa'),
                                    SizedBox(height: 8.0),
                                    Text(usersData[i]["telefono"].toString(),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                 icon: Icon(
                                   Icons.cancel,
                                   color: Colors.white,
                                   size: 25,
                                 ),
                              onPressed: () { Navigator.of(context).pop();}
                              )
                            ],
                          ),
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    height: 2.5,
                                    color: Colors.white,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 2.5,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                              //First Button
                              Material(
                                elevation: 6.0,
                                shadowColor: Colors.black45,
                                shape: StadiumBorder(),
                                clipBehavior: Clip.antiAlias,
                                color: Colors.blue[100],
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 32.0,
                                          vertical: 16.0,
                                        ),
                                        child: Text(
                                          'CONSEGNALA',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              SizedBox(height: 20),
                              //Second Button
                              Material(
                                elevation: 6.0,
                                shadowColor: Colors.black45,
                                shape: StadiumBorder(),
                                clipBehavior: Clip.antiAlias,
                                color: Colors.green[200],
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 32.0,
                                          vertical: 16.0,
                                        ),
                                        child: Text(
                                          'CHIAMA',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),



                            ],
                          ),
                        ),       
                      ],
                    ),
                  ),
                );
              });
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
                  'accessToken': 'pk.eyJ1IjoiYW5kcmVhY2Fyb3R0aSIsImEiOiJjazhuZHV4dHgwb3NlM2xvazcyMmZmNGM1In0.muRvmaS2sErXg8cZ3GPebA',
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
        height: 140.0,
        child: usersData == null ? Center(child: SpinKitCubeGrid(color: Colors.white, size: 50.0,)) : 
            ListView.builder(
              itemCount: usersData == null ? 0 : data.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: _boxes(
                      "https://cdn.dribbble.com/users/67525/screenshots/4517042/agarey_grocerydribbble.png",
                      usersData[index]["longitudine"],
                      usersData[index]["latitudine"],
                      usersData[index]["nome"],
                      index
                  ),
                );

              }
            ),
      ),
    );
  }

  Widget _boxes(String _image, double lat,double long,String boomerName, int index) {
    return  GestureDetector(
        onTap: () {
          //_gotoLocation(lat,long);
        },
        child:Container(
          child: new FittedBox(
            child: Material(
              color: Colors.white,
              elevation: 10.0,
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Colors.grey[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 200,
                    height: 180,
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
                      child: myDetailsContainer(boomerName, index),
                    ),
                  ),

                ]
              )
            ),
          ),
        ),
    );
  }

  Widget myDetailsContainer(String boomerName, int index) {
    return SizedBox(
      width: 230,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
                child: Text(boomerName,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold
                ),
            )),
          ),
          SizedBox(height: 5.0),
          Container(
            child: Text(
            usersData[index]["spesa"],
            style: TextStyle(
            color: Colors.black54,
            fontSize: 18.0,
            ),
          )
          ),
          SizedBox(height: 5.0),
          Container(
            child: Text(
              usersData[index]["telefono"].toString(),
              style: TextStyle(
                color: Colors.black54,
                fontSize: 22.0,
                fontWeight: FontWeight.bold
              ),
            )
          ),
        ],
      ),
    );
  }
/* 
  Future<void> _gotoLocation(double lat,double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat, long), zoom: 15,tilt: 50.0,
      bearing: 45.0,)));
  } */

}
