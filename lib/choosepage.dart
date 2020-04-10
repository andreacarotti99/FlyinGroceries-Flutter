import 'package:flutter/material.dart';
import 'package:VoloSpesa/resultpage.dart';
import 'package:VoloSpesa/theame.dart';


class ChoosePage extends StatefulWidget {
  @override
  _ChoosePageState createState() => _ChoosePageState();
}

class _ChoosePageState extends State<ChoosePage> {
 
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

            InkWell(
                  onTap: () {},
                  child: Container(
                  color: Colors.white,
                  margin: EdgeInsets.only(top: 10.0),
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Center(
                    child: Text(
                      'Seleziona il profilo che meglio ti identifica', 
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.bold,
                        fontSize: 28.0,
                        color: Colors.black
                      )
                    ),
                    ),
                  ),
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: FlatButton(
                    color: Colors.white,
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage())),
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      height: MediaQuery.of(context).size.height * 0.40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: Image(image: new AssetImage("assets/images/kidrunning.png"))
                          ),
                         //Image.asset('images/male.png',height: 100.0,width: 100.0,),
                         SizedBox(
                             height: 20.0,
                          ),
                        Text(
                          'Sono un Volontario', 
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.bold,
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
                  color: Colors.white,
                  onPressed: () => {}/*Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage()))*/,
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    height: MediaQuery.of(context).size.height * 0.40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        
                        Center(
                            child: Image(image: new AssetImage("assets/images/oldies.png"))
                          ),
                        //Image.asset('images/female.png',height: 100.0,width: 100.0,),
                        SizedBox(
                            height: 20.0,
                        ),
                        Text(
                          'Mi serve una mano', 
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.bold,
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

          

            ],
        ),
  
      
    );
  }
}
