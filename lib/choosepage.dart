import 'package:flutter/material.dart';
import 'package:VoloSpesa/appbarmappage.dart';
import 'package:VoloSpesa/boomerfirstpage.dart';
import 'package:VoloSpesa/theame.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';
import 'package:VoloSpesa/CRUD.dart';



Future<void>getTheLocation() async {
  askForLocation();
  var position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
}

Future<void>askForLocation() async {
  final status = await Permission.locationWhenInUse.request();
}

class ChoosePage extends StatefulWidget {
  @override
  _ChoosePageState createState() => _ChoosePageState();
}

class _ChoosePageState extends State<ChoosePage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    askForLocation();
    //var position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    //requestPermission(Permission.locationWhenInUse);
    
  }
 
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
          future: getTheLocation(),
          builder: (context, snapshot) {
          if( snapshot.connectionState == ConnectionState.done ) {
            return Container(
              color: primary,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: primary,
                    height: 300,
                    child: Column(
                      children: <Widget>[
                      Center(
                        child: Image(
                          height: 200,
                          width: 200,
                          image: AssetImage('assets/images/logobagcolor.png')),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 30.0, left: 10.0, right: 10.0),
                        child: Center(
                            child: Text(
                              'Seleziona il profilo che meglio ti identifica', 
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Averta',
                                fontWeight: FontWeight.bold,
                                fontSize: 28.0,
                                color: Colors.black
                              )
                            ),
                        ),
                      ),
                      ],
                    ),
                  ),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: FlatButton(
                          color: primary,
                          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage())),
                          child: Container(
                            
                            margin: EdgeInsets.all(4.0),
                            height: 300,
                            width: 200,
                            decoration: BoxDecoration(
                              boxShadow: [BoxShadow(
                                color: Colors.grey[300],
                                blurRadius: 10.0, // has the effect of softening the shadow
                                spreadRadius: 5.0, // has the effect of extending the shadow
                                offset: Offset(
                                  0.0, // horizontal, move right 10
                                  2.0, // vertical, move down 10
                                )
                              )
                              ],
                              color: secondary,
                              borderRadius: BorderRadius.circular(30.0),
                              
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Center(
                                  child: Image(image: new AssetImage("assets/images/kidrunning.png"))
                                ),
                               
                               SizedBox(
                                   height: 20.0,
                                ),
                              Text(
                                'Sono un Volontario', 
                                style: TextStyle(
                                  fontFamily: 'Averta',
                                  fontSize: 16.0,
                                  color: Colors.black
                                )
                              ),
                             ],
                            ),
                           
                          ),
                          )
                        ),
                    Expanded(
                      flex: 1,
                      child: FlatButton(
                        color: primary,
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MyFormsPage())),
                        child: Container(
                          margin: EdgeInsets.all(4.0),
                          height: 300,
                          width: 200,
                          decoration: BoxDecoration(
                              boxShadow: [BoxShadow(
                                color: Colors.grey[300],
                                blurRadius: 10.0, // has the effect of softening the shadow
                                spreadRadius: 5.0, // has the effect of extending the shadow
                                offset: Offset(
                                  0.0, // horizontal, move right 10
                                  2.0, // vertical, move down 10
                                )
                              )
                              ],
                              color: secondary,
                              borderRadius: BorderRadius.circular(30.0),
                              
                            ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              
                              Center(
                                  child: Image(image: new AssetImage("assets/images/oldies.png"))
                                ),
                              //Image.asset('images/female.png',height: 100.0,width: 100.0,),
                              SizedBox(
                                  height: 20.0,
                              ),
                              Text(
                                'Sono anziano', 
                                style: TextStyle(
                                  fontFamily: 'Averta',
                                  fontSize: 16.0,
                                  color: Colors.black
                                )
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    ],
                  ),
                  SizedBox(height: 14.0),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: bluChiaro,
                        borderRadius: BorderRadius.circular(20.0)
                      ),
                      width: 120.0,
                      height: 50.0,
                      child: Center(
                        child: Text(
                          'Contattaci',
                          style: TextStyle(
                            color: colorNextButton,
                            fontFamily: 'Averta',
                            fontSize: 14.0
                          )
                        )
                      ),
                    )
                  )
                ],
              ),
          );
          
        }
        else {
            return SpinKitThreeBounce(color: secondary,);
          }
      }
    );
      
  }
}
