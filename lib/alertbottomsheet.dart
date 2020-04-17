import 'package:VoloSpesa/theame.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:VoloSpesa/CRUD.dart';
import 'package:VoloSpesa/choosepage.dart';




Future<void> showAlertConfirmationButton(String nome, String indirizzo, String telefono, String spesa, var noteID, BuildContext context) {
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
      type: AlertType.warning,
      title: "CONFERMA PRESA IN CARICO",
      desc: "Una volta confermato, l'ordine verrà rimosso dalla mappa",
      buttons: [
        DialogButton(
          radius: BorderRadius.circular(20.0),
          color: Colors.green[300],
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            deleteMarker(nome, indirizzo, telefono, spesa, noteID);
            
            Navigator.push(context, MaterialPageRoute(builder: (context) => ChoosePage()));


          },
        ),
        DialogButton(
          radius: BorderRadius.circular(20.0),
          child: Text(
            "Annulla",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          gradient: LinearGradient(colors: [
            colorNextButton,
            colorNextButton,
          ]),
        )
      ],
    ).show();
}