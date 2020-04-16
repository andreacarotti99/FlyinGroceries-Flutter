import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:VoloSpesa/mappage.dart';
import 'package:url_launcher/url_launcher.dart';

void addUserMarker(List markerList, double lat, double lng, BuildContext context) {
      markerList.add(
      new Marker(
        width: 60.0,
        height: 60.0,
        point: new LatLng(lat, lng),
        builder: (context) => new Container(
          child: IconButton(
            icon: Image(image: new AssetImage("assets/images/usermarker.png")),
            color: Colors.blue,
            iconSize: 100.0,
            onPressed: () {}
          )
        )
      )
    );
}
