
import 'package:http/http.dart' as http;
import 'dart:async';


Future<http.Response> deleteMarker(String nome, String indirizzo, String telefono, String spesa, String noteID) async {

    var response = await http.delete(
    'http://api.volospesa.org/api/v1/messages/' + noteID,
    headers: {
      'content-type': 'application/json'
    });

    if (response.statusCode == 200) {
      print('DELETE avvenuta correttamente');
    }
    else {
      print('Errore durante la DELETE');   
      print(response.statusCode); 
    }
  }

//https://volospesa-server.herokuapp.com/api/v1/messages/
