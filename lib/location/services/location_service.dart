import 'dart:async';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:VoloSpesa/location/datamodels/user_location.dart';


class LocationService {
  UserLocation _currentLocation;

  Location location = Location();

  StreamController<UserLocation> _locationController = StreamController<UserLocation>();

  LocationService() {
    // Request permission to use location
    location.requestPermission().then((granted) {
        // If granted listen to the onLocationChanged stream and emit over our controller
        location.onLocationChanged().listen((locationData) {
          if (locationData != null) {
            _locationController.add(UserLocation(
              latitude: locationData.latitude,
              longitude: locationData.longitude,
            ));
          }
        });
      
    });
  }

  Stream<UserLocation> get locationStream => _locationController.stream;

  Future<UserLocation> getLocation() async {
    try {
      var userLocation = await location.getLocation();
      _currentLocation = UserLocation(
        latitude: userLocation.latitude,
        longitude: userLocation.longitude,
      );
    } on Exception catch (e) {
      print('Could not get location: ${e.toString()}');
    }

    return _currentLocation;
  }
}