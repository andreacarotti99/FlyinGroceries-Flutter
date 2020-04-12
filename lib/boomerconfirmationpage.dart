import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:VoloSpesa/models.dart';

class ConfirmationPage extends StatelessWidget {
  BoomerInfo boomerInfo;
  ConfirmationPage({Key key, @required this.boomerInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            RaisedButton(
                child: Text("Continua"),
                onPressed: (){
                  uploadBoomerInfo(boomerInfo.name, boomerInfo.address, boomerInfo.phone, boomerInfo.groceries);
                  print(boomerInfo.groceries);
                  print(boomerInfo.name);
                  print(boomerInfo.address);
                  print(boomerInfo.phone);
                },
            ), 
          ]
        ),
      )
    );
  }
}

Future<http.Response> uploadBoomerInfo(String nome, String indirizzo, String telefono, String spesa) async {
  final http.Response response = await http.post(
    'https://volospesa-server.herokuapp.com/api/v1/messages',
    headers: {
      'content-type': 'application/json' 
    },
    body: jsonEncode(
      <String, String>{
      'nome': nome,
      'indirizzo': indirizzo,
      'telefono': telefono,
      'spesa': spesa,
      }
    ),
  );
  if (response.statusCode == 200) {
    print('POST avvenuta correttamente');
  }
  else {
    print('Errore durante la POST');   
    print(response.statusCode);   
  }
}
