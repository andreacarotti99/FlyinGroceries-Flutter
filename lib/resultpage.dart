import 'package:VoloSpesa/theame.dart';
import 'package:flutter/material.dart';
import 'package:VoloSpesa/mappage.dart';

class ResultPage extends StatelessWidget {
  final int height;
  final int weight;
  ResultPage({this.height,this.weight});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: secondary,
        leading: IconButton(icon:Icon(Icons.arrow_back_ios, color: Colors.black), onPressed: () => Navigator.pop(context),),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            Image.asset('assets/images/kidrunning.png', fit: BoxFit.contain, height: 32.0),
            Container(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text(
                    'VoloSpesa',
                    style: TextStyle(color: Colors.black),
                  )
            )
          ],
        ),
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
