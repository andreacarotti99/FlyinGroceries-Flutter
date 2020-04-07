import 'package:flutter/material.dart';
import 'package:VoloSpesa/theame.dart';
import 'package:VoloSpesa/map_boxes.dart';

class ResultPage extends StatelessWidget {
  final int height;
  final int weight;
  ResultPage({this.height,this.weight});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('YOUR RESULT'),
        backgroundColor: Colors.transparent,
        leading: IconButton(icon:Icon(Icons.arrow_back_ios), onPressed: () => Navigator.pop(context),),
      ),
      body: Result(),
    );
  }
}

class Result extends StatefulWidget {
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return MapPage();
  }
}
