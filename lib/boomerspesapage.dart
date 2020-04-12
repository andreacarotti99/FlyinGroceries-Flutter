import 'package:flutter/material.dart';
import 'package:VoloSpesa/models.dart';
import 'package:VoloSpesa/boomerconfirmationpage.dart';




class SpesaPage extends StatelessWidget {
  final BoomerInfo boomerInfo;
  SpesaPage({Key key, @required this.boomerInfo}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SpesaWidget(boomerInfo: boomerInfo);

  }
}


class SpesaWidget extends StatefulWidget {
  BoomerInfo boomerInfo;
  SpesaWidget({Key key, @required this.boomerInfo}) : super(key: key);
  @override
  _SpesaWidgetState createState() => _SpesaWidgetState();
}

class _SpesaWidgetState extends State<SpesaWidget> {
  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
  TextEditingController _groceriesController = new TextEditingController();
  _groceriesController.text = widget.boomerInfo.groceries;

    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.5)
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Inserisci la tua spesa',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      controller: _groceriesController,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Perfavore inserisci la spesa: premi lo spazio bianco e poi digita';
                        }
                      },
                ),
              ),
              RaisedButton(
                  child: Text("Continua"),
                  onPressed: (){
                    setState(() {
                      if (_formKey.currentState.validate()) {
                        widget.boomerInfo.groceries = _groceriesController.text;
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ConfirmationPage(boomerInfo: widget.boomerInfo,)));
                      }
                    });
                  },
              ),
            ],
          ),
        )
      )
    );
  }
}




