import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong/latlong.dart';

class MapPage extends StatefulWidget {
  @override
  MapPageState createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  //Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
  }
    double zoomVal=5.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(FontAwesomeIcons.arrowLeft),
            onPressed: () {
              //
            }),
        title: Text("New York"),
        actions: <Widget>[
          IconButton(
              icon: Icon(FontAwesomeIcons.search),
              onPressed: () {
                //
              }),
        ],
      ),
      body: Stack(
        children: <Widget>[
          _buildGoogleMap(context),
          _buildContainer(),
        ],
      ),
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

  Widget _boxes(String _image, double lat,double long,String restaurantName) {
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
                    shadowColor: Color(0x802196F3),
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
                          ),),
                          Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: myDetailsContainer1(restaurantName),
                          ),
                        ),

                      ],)
                ),
              ),
            ),
    );
  }

  Widget myDetailsContainer1(String restaurantName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(restaurantName,
            style: TextStyle(
                color: Color(0xff6200ee),
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
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStar,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
              Container(
                child: Icon(
                  FontAwesomeIcons.solidStarHalf,
                  color: Colors.amber,
                  size: 15.0,
                ),
              ),
               Container(
                  child: Text(
                "(946)",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              )),
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

  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
        child: new FlutterMap(
          options: new MapOptions(
              center: new LatLng(35.22, -101.83), minZoom: 10.0),
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
            new MarkerLayerOptions(markers: [
                new Marker(
                    width: 45.0,
                    height: 45.0,
                    point: new LatLng(35.215, -101.825),
                    builder: (context) => new Container(
                          child: IconButton(
                            icon: Icon(Icons.location_on),
                            color: Colors.blue,
                            iconSize: 45.0,
                            onPressed: () {
                              print('Marker tapped');
                            },
                          ),
                        ))
            ])

          ]
        )
    );
  }
/* 
  Future<void> _gotoLocation(double lat,double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat, long), zoom: 15,tilt: 50.0,
      bearing: 45.0,)));
  } */
}
