import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'choosepage.dart';
 
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown]);
    return MaterialApp(
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
        body: ChoosePage()
        //TwoCards(),
    );
  }
}