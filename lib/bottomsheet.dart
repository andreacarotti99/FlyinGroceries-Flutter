import 'package:VoloSpesa/alertbottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:VoloSpesa/theame.dart';
import 'package:VoloSpesa/bottoneUi.dart';
import 'package:VoloSpesa/CRUD.dart';

Widget buildBottomSheet(BuildContext context, List usersData, int i) {
  return Padding(
    padding: EdgeInsets.only(
      top: MediaQuery.of(context).padding.top + MediaQuery.of(context).padding.bottom,
    ),
    child: Material(
      color: primary,
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(32.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: <Widget>[
                SizedBox.fromSize(
                  size: Size.fromRadius(38.0),
                  child: Material(
                    color: primary,
                    shape: CircleBorder(),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      'assets/images/sitmarker.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.account_circle, color: primary),
                          SizedBox(width: 5.0),
                          Text(
                            usersData[i]["nome"].toUpperCase(),
                            style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      
                      Row(
                        children: <Widget>[
                          Icon(Icons.phone, color: Colors.green[300]),
                          SizedBox(width: 5.0),
                          Text(usersData[i]["telefono"].toString(), style: testi),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.home, color: colorNextButton),
                          SizedBox(width: 5.0),
                          Expanded(child: Container(child: Text(usersData[i]['indirizzo'], style: testi))),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 2.5,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 2.5,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Center(
                  child : Container(
                    padding: EdgeInsets.all(5.0),
                    child: Text('Qui sotto trovi la sua spesa, chiama per dare una mano',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Averta',
                        fontSize: 14.0
                    )))
                ),
                SizedBox(height: 6.0),
                //First Button
                Center(
                  child: Container(
                    width: 380,
                    height: 80,
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: secondary,
                      boxShadow: [BoxShadow(
                          color: Colors.grey[300],
                          blurRadius: 10.0, // has the effect of softening the shadow
                          spreadRadius: 5.0, // has the effect of extending the shadow
                          offset: Offset(0.0, 2.0,))],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    child: Text(
                                      usersData[i]['spesa'],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Averta',
                                        fontSize: 14.0
                                      )
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    )
                  ),
                ),
                SizedBox(height: 10.0),
                Material(
                  elevation: 6.0,
                  shadowColor: Colors.black45,
                  shape: StadiumBorder(),
                  clipBehavior: Clip.antiAlias,
                  color: colorNextButton,
                  child: InkWell(
                    onTap: () {
                      //serve per ricostruire la mappa senza marker che si è eliminiato
                      showAlertConfirmationButton(usersData[i]["nome"], usersData[i]["telefono"],usersData[i]["indirizzo"],usersData[i]["spesa"], usersData[i]["_id"], context);

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32.0,
                            vertical: 12.0,
                          ),
                          child: Text(
                            'SEGNA COME CONSEGNA AVVENUTA',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                BottoneUi(phoneNumber: usersData[i]["telefono"]),
              ],
            ),
          ),       
        ],
      ),
    ),
  );
}