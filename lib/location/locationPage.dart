import 'dart:async';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:VoloSpesa/location/datamodels/user_location.dart';
import 'package:VoloSpesa/location/services/location_service.dart';
import 'package:provider/provider.dart';



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserLocation>(
      create: (context) => LocationService().locationStream,
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Scaffold(
            body: HomeView(),
          )
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userLocation = Provider.of<UserLocation>(context);
    return Center(
      child: Text(
          'Location: Lat${userLocation?.latitude}, Long: ${userLocation?.longitude}'),
    );
  }
}