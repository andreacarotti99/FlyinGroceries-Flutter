import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:VoloSpesa/theame.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:VoloSpesa/choosepage.dart';

import 'package:VoloSpesa/CRUD.dart';
import 'package:VoloSpesa/markerhandler.dart';

const minDistance = 400000000;
Position position;

class MapPage extends StatefulWidget {
  @override
  MapPageState createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  List <Marker> allMarkers = [];
  List data;
  List usersData;
  
  @override
  void initState() {
    super.initState();
    getMarkers();
  }

  getMarkers() async {
    http.Response response = await http.get('https://volospesa-server.herokuapp.com/api/v1/messages');
    data = json.decode(response.body);
    print(response.statusCode);
    position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    //PermissionStatus permission = await LocationPermissions().checkPermissionStatus();
    addUserMarker(allMarkers, position.latitude, position.longitude, context);

    setState(() {
      usersData = data;
    });
    
    for (int i = 0; i < usersData.length; i++) {
      allMarkers.add(
        new Marker(
          width: 84.0,
          height: 84.0,
          point: new LatLng(usersData[i]["latitudine"], usersData[i]["longitudine"]),
          builder: (context) => new Container(
            child: IconButton(
              icon: Image(image: new AssetImage("assets/images/sitmarker.png")),
              iconSize: 140.0,
              onPressed: () {
                
                print('Marker tapped');
                showModalBottomSheet(context: context, backgroundColor: Colors.transparent, builder: (builder){
                  return Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top + MediaQuery.of(context).padding.bottom,
                    ),
                    child: Material(
                      elevation: 12.0,
                      color: primary,
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
                                  size: Size.fromRadius(38.0),
                                  child: Material(
                                    color: primary,
                                    shape: CircleBorder(),
                                    clipBehavior: Clip.antiAlias,
                                    child: Image.asset(
                                      'assets/images/sitmarker.png',
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
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text('Consegnagli adesso la spesa',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black,                                     
                                        ),                                    
                                      ),
                                      Text(
                                        usersData[i]["telefono"].toString(),
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),                                    
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.cancel,
                                    color: Colors.blue[100],
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
                                SizedBox(height: 20),
                                //First Button
                                Material(
                                  elevation: 10.0,
                                  shadowColor: Colors.black45,
                                  shape: StadiumBorder(),
                                  clipBehavior: Clip.antiAlias,
                                  color: Colors.blue[100],
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                      deleteMarker(usersData[i]["nome"], usersData[i]["telefono"],usersData[i]["indirizzo"],usersData[i]["spesa"], usersData[i]["_id"]);
                                      //serve per ricostruire la mappa senza marker che si è eliminiato
                                      setState(() {
                                        allMarkers = [];
                                        getMarkers();
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 32.0,
                                            vertical: 20.0,
                                          ),
                                          child: Text(
                                            'SEGNA COME CONSEGNA AVVENUTA',
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
                                SizedBox(height: 30),
                                BottoneUi(text: 'CHIAMA'),
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

  



  Widget _buildMapBox(BuildContext context, double latitudine, double longitudine) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
        child: new FlutterMap(
          options: new MapOptions(
              center: new LatLng(latitudine, longitudine), zoom: 13.0),
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
        child: data == null ? Center(child: SpinKitThreeBounce(color: Colors.white, size: 30.0,)) : 
            ListView.builder(
              itemCount: usersData == null ? 0 : usersData.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: _boxes(
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

  Widget _boxes(double lat,double long,String boomerName, int index) {
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
                        image: AssetImage('assets/images/baggy.png'),
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
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
                child: Text(boomerName.toUpperCase(),
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Averta',
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold
                ),
            )
          ),
          SizedBox(height: 10.0),
          Container(
            child: Row(
              children: <Widget>[
                Container(width: 24.0, height: 24.0, child: Icon(Icons.phone, color: Colors.green[300],)),
                SizedBox(width: 8.0),
                Text(
                  usersData[index]["telefono"].toString(),
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            )
          ),
        ],
      ),
    );
  }

  Future<void>getLocation() async {
    position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder( 
        future: getLocation(),
        builder: (context, snapshot) { 
          if(snapshot.connectionState == ConnectionState.done){
          return Stack(
          children: <Widget>[
            _buildMapBox(context, position.latitude, position.longitude),
            _buildContainer(),
          ],
        );
        }
        else {
          return Scaffold(
            backgroundColor: primary,
            body: Column(
              children: <Widget>[
                SizedBox(height: 250),
                Center(
                  child: SpinKitThreeBounce(color: Colors.white, size: 30.0),
                )
              ],
            ));
        }
      }
      ),
    );
  }
}


