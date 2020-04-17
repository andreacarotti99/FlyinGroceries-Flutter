import 'package:flutter/material.dart';
import 'package:VoloSpesa/boomerspesapage.dart';
import 'package:VoloSpesa/models.dart';
import 'package:VoloSpesa/theame.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geocoder/geocoder.dart';

const kGoogleApiKey = "AIzaSyCvkzzEUKf9BF4bSZdBzvvLuU9s3xP2Ae8";
GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

class MyFormsPage extends StatefulWidget {
  @override
  _MyFormsPageState createState() => _MyFormsPageState();
}

class _MyFormsPageState extends State<MyFormsPage> {
  var _formKey = GlobalKey<FormState>();
  final boomerInfo = new BoomerInfo(null, null, null, null, null, null);

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = new TextEditingController();
    TextEditingController _phoneController = new TextEditingController();
    TextEditingController _addressController = new TextEditingController();
    _nameController.text = boomerInfo.name;
    _addressController.text = boomerInfo.address;
    _phoneController.text = boomerInfo.phone;

  Future<Null> displayPrediction(Prediction p) async {
      if (p != null) {
        PlacesDetailsResponse detail = await _places.getDetailsByPlaceId(p.placeId);
        var placeId = p.placeId;

        double lat = detail.result.geometry.location.lat;
        double lng = detail.result.geometry.location.lng;
        
        var address = await Geocoder.local.findAddressesFromQuery(p.description); //da fixare su ios
        print(lat);
        print(lng);
        boomerInfo.lat = lat;
        boomerInfo.long = lng;
        _addressController.text = p.description;
      }
    }
    
    
    
    return Scaffold( 
      backgroundColor: primary,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Compila i campi qua sotto e premi CONTINUA', 
                    textAlign: TextAlign.center,
                    style: titoli,
                  ),
                ),
              ),
              
              
              Form(
                key: _formKey,
                child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 400,
                      height: 60,
                          decoration: BoxDecoration(
                            color: secondary,
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                          child: Row(
                            children: <Widget>[
                              SizedBox(width: 20.0,),
                              Icon(Icons.person_outline, size: 20.0, color: Colors.grey),
                              SizedBox(width: 10.0,),
                              Container(
                                decoration: BoxDecoration(color: Colors.grey),
                                width: 1.0,
                                height: 30.0,
                              ),
                              SizedBox(width: 10.0,),
                              SizedBox(
                                width: 280,
                                child: TextFormField(
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Inserisci il tuo nome',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Averta'
                                    ),
                                  ),
                                  controller: _nameController,
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return 'Premi lo spazio bianco e poi digita il tuo nome';
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                    ),
                    Container(
                      width: 400,
                      height: 60,
                          decoration: BoxDecoration(
                            color: secondary,
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                          child: Row(
                            children: <Widget>[
                              SizedBox(width: 20.0,),
                              Icon(Icons.phone, size: 20.0, color: Colors.grey),
                              SizedBox(width: 10.0,),
                              Container(
                                decoration: BoxDecoration(color: Colors.grey),
                                width: 1.0,
                                height: 30.0,
                              ),
                              SizedBox(width: 10.0,),
                              SizedBox(
                                width: 280,
                                child: TextFormField(
                                  keyboardType: TextInputType.numberWithOptions(),
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(

                                    border: InputBorder.none,
                                    hintText: 'Inserisci il tuo telefono',
                                    hintStyle: TextStyle(color: Colors.grey, fontFamily: 'Averta'),
                                  ),
                                  controller: _phoneController,
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return 'Premi lo spazio bianco e poi digita il tuo telefono';
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                    ),
                    Container(
                      width: 400,
                      height: 60,
                          decoration: BoxDecoration(
                            color: secondary,
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                          child: Row(
                            children: <Widget>[
                              SizedBox(width: 20.0,),
                              Icon(Icons.home, size: 20.0, color: Colors.grey),
                              SizedBox(width: 10.0,),
                              Container(
                                decoration: BoxDecoration(color: Colors.grey),
                                width: 1.0,
                                height: 30.0,
                              ),
                              SizedBox(width: 10.0,),
                              
                              SizedBox(
                                width: 280,
                                child: TextFormField(
                                  onTap: () async {
                                    Prediction p = await PlacesAutocomplete.show(
                                      context: context,
                                      apiKey: "AIzaSyCvkzzEUKf9BF4bSZdBzvvLuU9s3xP2Ae8",
                                      mode: Mode.overlay,
                                      language: "it",
                                      components: [Component(Component.country, "it")],
                                      overlayBorderRadius: BorderRadius.circular(14.0),
                                      hint: 'Inserisci qui il tuo indirizzo',
                                      logo: Container(width: 380, height: 10),
                                      
                                    );
                                    displayPrediction(p);

                                    
                                  },
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Inserisci il tuo indirizzo',
                                    hintStyle: TextStyle(color: Colors.grey, fontFamily: 'Averta'),
                                  ),
                                  controller: _addressController,
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      
                                      return 'Premi lo spazio bianco e poi digita il tuo indirizzo';
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                    ), 
                  ],
                ),
              ),
              ),
              
              

              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Material(
                  elevation: 10.0,
                  shadowColor: Colors.black45,
                  shape: StadiumBorder(),
                  clipBehavior: Clip.antiAlias,
                  color: colorNextButton,
                  child: InkWell(
                    onTap: () {
                
                      setState(() {
                        if (_formKey.currentState.validate()) {
                          boomerInfo.name = _nameController.text;
                          boomerInfo.address = _addressController.text;
                          boomerInfo.phone = _phoneController.text;
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SpesaPage(boomerInfo: boomerInfo,)));
                        }
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
                            'CONTINUA',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Averta',
                              fontSize: 16.0
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      )
    );
  }
}



  