import 'package:VoloSpesa/theame.dart';
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
      backgroundColor: primary,
      body: Center(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                      Center(
                          child: Text(
                            'Digita qua sotto la tua spesa e premi CONTINUA', 
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Averta',
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0,
                              color: Colors.black
                            )
                          ),
                      ),

                      Container(
                        width: 400,
                        height: 250,
                        decoration: BoxDecoration(
                          color: secondary,
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        child: Center(
                              child: Container(
                                width: 300,
                                child: TextFormField(
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Inserisci la tua spesa',
                                    hintStyle: TextStyle(color: Colors.grey, fontFamily: 'Averta'),
                                  ),
                                  controller: _groceriesController,
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return 'Perfavore inserisci la tua spesa';
                                    }
                                  },
                                ),
                              ),
                            ),
                        
                      ),

                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Material(
                    elevation: 10.0,
                    shadowColor: Colors.black45,
                    shape: StadiumBorder(),
                    clipBehavior: Clip.antiAlias,
                    color: colorNextButton,
                    child: InkWell(
                      onTap: () {
                  
                      setState(() {
                        if (_formKey.currentState.validate()) {
                          widget.boomerInfo.groceries = _groceriesController.text;
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ConfirmationPage(boomerInfo: widget.boomerInfo,)));
                        }
                      });  
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32.0,
                              vertical: 20.0,
                            ),
                            child: Text(
                              'CONTINUA',
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
                ),
              ],
            ),
          ),
        )
      )
    );
  }
}




