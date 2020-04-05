import 'package:flutter/material.dart';
import 'package:VoloSpesa/resultpage.dart';
import 'package:VoloSpesa/theame.dart';


class BmiPage extends StatefulWidget {

  @override
  _BmiPageState createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {

  int age = 17;
  int weight = 50;

  int height = 180;
  double maxHeight = 220;
  double minHeight = 120;
 
  @override
  Widget build(BuildContext context) {
    return Container(
        color:secondary,
        child: Column(
          children: <Widget>[
            AppBar(
              title: Center(child: Text("SELEZIONA UNA DELLE DUE CATEGORIE")),
              elevation: 0,
              backgroundColor: Colors.transparent,
              
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: FlatButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(height: height,weight: weight,))),
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      height: MediaQuery.of(context).size.height * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: primary
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                         //Image.asset('images/male.png',height: 100.0,width: 100.0,),
                         SizedBox(
                             height: 20.0,
                          ),
                         Text('GIOVINE',style: headlines)
                       ],
                        ),
                     
                    ),
                    )
                  ),
                  Expanded(
                    flex: 1,
                    child: FlatButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(height: height,weight: weight,))),
                      child: Container(
                      margin: EdgeInsets.all(10.0),
                      height: MediaQuery.of(context).size.height * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: primary
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          //Image.asset('images/female.png',height: 100.0,width: 100.0,),
                          SizedBox(
                             height: 20.0,
                          ),
                          Text('BOOMER',style: headlines)
                        ],
                      ),
                    ),
                  ),
                  )
                
              ],
            ),

            
            
             InkWell(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(height: height,weight: weight,))),
                  child: Container(
                  color: primaryButtonColor,
                  margin: EdgeInsets.only(top: 10.0),
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Center(
                    child: Text('CONFIRM', style: primaryButtonStyle),
                    ),
               ),
             ),
          

            ],
        ),
  
      
    );
  }
}
