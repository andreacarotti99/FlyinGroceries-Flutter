import 'package:VoloSpesa/theame.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:VoloSpesa/CRUD.dart';
import 'package:VoloSpesa/choosepage.dart';




Future<void> showPrivacyBanner(BuildContext context) {
  

   var alertStyle = AlertStyle(
     overlayColor: Colors.black54,
     backgroundColor: primary,
      animationType: AnimationType.fromBottom,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      titleStyle: TextStyle(fontFamily: 'Averta', fontSize: 24.0, color: Colors.black),
      descStyle: TextStyle(fontFamily: 'Averta', fontSize: 14.0, color: Colors.black),
      animationDuration: Duration(milliseconds: 500),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: BorderSide(
          color: Colors.grey,
        ),
      ),
      
  );

  return Alert(
      style: alertStyle,
      context: context,
      type: AlertType.info,
      title: "Avvertenze",
      desc: "Perdavore ricorda che le misure di igiene disposte sono molto importanti e il mancato rispetto di esse potrebbe mettere la vita tua, e degli altri in pericolo",
      buttons: [
        DialogButton(
          radius: BorderRadius.circular(20.0),
          color: Colors.green[300],
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        
      ],
    ).show();
}