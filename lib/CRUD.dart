
import 'package:http/http.dart' as http;
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
import 'package:VoloSpesa/bottoneUi.dart';

import 'package:VoloSpesa/CRUD.dart';
import 'package:VoloSpesa/markerhandler.dart';

import 'package:map_controller/map_controller.dart';
import 'dart:async';

import 'package:VoloSpesa/detailscontainer.dart';

Future<http.Response> deleteMarker(String nome, String indirizzo, String telefono, String spesa, String noteID) async {

    var response = await http.delete(
    'https://volospesa-server.herokuapp.com/api/v1/messages/' + noteID,
    headers: {
      'content-type': 'application/json'
    });

    if (response.statusCode == 200) {
      print('DELETE avvenuta correttamente');
    }
    else {
      print('Errore durante la DELETE');   
      print(response.statusCode); 
    }
  }

