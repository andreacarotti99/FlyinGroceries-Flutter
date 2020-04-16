import 'package:VoloSpesa/bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:VoloSpesa/theame.dart';
import 'package:location_permissions/location_permissions.dart';

import 'package:VoloSpesa/markerhandler.dart';

import 'dart:async';

import 'package:VoloSpesa/detailscontainer.dart';



Position position;

class MapPage extends StatefulWidget {
  @override
  MapPageState createState() => MapPageState();
}

class MapPageState extends State<MapPage> with TickerProviderStateMixin {
  List <Marker> allMarkers = [];
  List data;
  List usersData;
  List closeBoomersList = [];
  MapController mapController;
  //StatefulMapController statefulMapController;
  
  @override
  void initState() {
    super.initState();
    getMarkers();
    mapController = MapController();
  }

  getMarkers() async {
    http.Response response = await http.get('https://volospesa-server.herokuapp.com/api/v1/messages');
    data = json.decode(response.body);
    print(response.statusCode);
    position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    //PermissionStatus permission = await LocationPermissions().checkPermissionStatus();

    setState(() {
      usersData = data;
    });
    
    addUserMarker(allMarkers, position.latitude, position.longitude, context);

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
                showModalBottomSheet(context: context, elevation: 400.0, backgroundColor: Colors.transparent, builder: (builder){
                  return buildBottomSheet(context, usersData, i);
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
          ],
          mapController: mapController,
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
              itemCount: closeBoomersList == null ? 0 : closeBoomersList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: _boxes(
                      closeBoomersList[index]["longitudine"],
                      closeBoomersList[index]["latitudine"],
                      closeBoomersList[index]["nome"],
                      index,
                      closeBoomersList
                  ),
                );
              }
            ),
      ),
    );
  }

  Widget _boxes(double lat,double long, String boomerName, int index, List closeBoomersList) {
    return  GestureDetector(
        onTap: () { 
          animatedMapMove(LatLng(closeBoomersList[index]['latitudine'], closeBoomersList[index]['longitudine']), 13.2);
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
                      child: myDetailsContainer(boomerName, index, closeBoomersList),
                    ),
                  ),
                ]
              )
            ),
          ),
        ),
    );
  }

  Future<void>getLocation() async {
    closeBoomersList = [];
    position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    http.Response response = await http.get('https://volospesa-server.herokuapp.com/api/v1/messages');
    usersData = json.decode(response.body);

    for (int i = 0; i < usersData.length; i++) {
      const double maxDistanceForContainers = 3000;
      double distanceBetweenUsers = await Geolocator().distanceBetween(position.latitude, position.longitude, usersData[i]['latitudine'], usersData[i]['longitudine']);
      //calculate distance(usersBetweenDistance) between the usersData[i] coordinates and the location of the user
      if (distanceBetweenUsers < maxDistanceForContainers) {
        //adding to the list of elements (old people) close to the users
        closeBoomersList.add(usersData[i]);
        print(distanceBetweenUsers);
      }
    }
  }

    void animatedMapMove(LatLng destLocation, double destZoom) {
      final _latTween = Tween<double>(begin: mapController.center.latitude, end: destLocation.latitude);
      final _lngTween = Tween<double>(begin: mapController.center.longitude, end: destLocation.longitude);
      final _zoomTween = Tween<double>(begin: mapController.zoom, end: destZoom);
      var controller = AnimationController(duration: const Duration(milliseconds: 500), vsync: this);
      Animation<double> animation = CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

      controller.addListener(() {
        mapController.move(
            LatLng(_latTween.evaluate(animation), _lngTween.evaluate(animation)),
            _zoomTween.evaluate(animation));
      });
      animation.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.dispose();
        } else if (status == AnimationStatus.dismissed) {
          controller.dispose();
        }
      });
      controller.forward();
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


