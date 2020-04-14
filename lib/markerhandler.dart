import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_map/plugin_api.dart';

void addUserMarker(List allMarkers, double lat, double lng, BuildContext context) {
      allMarkers.add(
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

class BottoneUi extends StatelessWidget {
  String text;
  BottoneUi({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
    elevation: 10.0,
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
              vertical: 20.0,
            ),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    ),
  );
  }
}
