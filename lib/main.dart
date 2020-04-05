import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

import 'bmipage.dart';
 
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown]);
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BmiPage()
      );
  }
}

class MapBox extends StatefulWidget {
  @override
  _MapBoxState createState() => _MapBoxState();
}

class _MapBoxState extends State<MapBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new FlutterMap(
        options: new MapOptions(
          center: LatLng(40.71, -74.0),
          minZoom: 13.0
        ),
        layers: [
          new TileLayerOptions(
            urlTemplate: "https://api.mapbox.com/styles/v1/andreacarotti/ck8ndy79206g91io8jhmrh20f/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYW5kcmVhY2Fyb3R0aSIsImEiOiJjazhuZHBlbDcwYWgzM2ZwaTVsc3Jnbm1jIn0.IgBj1EEumtK3lTtVOP7nsA",
            additionalOptions: {
              'accessToken' : 'pk.eyJ1IjoiYW5kcmVhY2Fyb3R0aSIsImEiOiJjazhuZHV4dHgwb3NlM2xvazcyMmZmNGM1In0.muRvmaS2sErXg8cZ3GPebA',
              'id' : 'mapbox.mapbox-streets-v7'
            }
          )
        ],
      )
    );
  }
}