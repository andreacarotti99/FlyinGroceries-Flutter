import 'package:flutter/material.dart';
import 'package:VoloSpesa/boomerspesapage.dart';
import 'package:VoloSpesa/models.dart';
import 'package:VoloSpesa/theame.dart';



class MyFormsPage extends StatefulWidget {
  @override
  _MyFormsPageState createState() => _MyFormsPageState();
}

class _MyFormsPageState extends State<MyFormsPage> {
  var _formKey = GlobalKey<FormState>();
  final boomerInfo = new BoomerInfo(null, null, null, null);

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = new TextEditingController();
    TextEditingController _phoneController = new TextEditingController();
    TextEditingController _addressController = new TextEditingController();
    _nameController.text = boomerInfo.name;
    _addressController.text = boomerInfo.address;
    _phoneController.text = boomerInfo.phone;
    
    
    return Scaffold(
      backgroundColor: primary,
      appBar: AppBar(
        title: Text('FORM'),
        backgroundColor: Colors.transparent,
        leading: IconButton(icon:Icon(Icons.arrow_back_ios), onPressed: () => Navigator.pop(context),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            Form(
              key: _formKey,
              child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
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
                            hintText: 'Inserisci il tuo nome',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          controller: _nameController,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Perfavore inserisci il tuo nome: premi lo spazio bianco e poi digita';
                            }
                          },
                        ),
                  ),
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
                            hintText: 'Inserisci il tuo telefono',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          controller: _phoneController,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Perfavore inserisci il tuo telefono: premi lo spazio bianco e poi digita';
                            }
                          },
                        ),
                  ),
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
                              hintText: 'Inserisci il tuo indirizzo',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                            controller: _addressController,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Perfavore inserisci il tuo telefono: premi lo spazio bianco e poi digita';
                              }
                            },
                      ),
                  ),  
                ],
              ),
            ),
            ),
            RaisedButton(
                child: Text("Continua"),
                onPressed: (){
                  setState(() {
                    if (_formKey.currentState.validate()) {
                      boomerInfo.name = _nameController.text;
                      boomerInfo.address = _addressController.text;
                      boomerInfo.phone = _phoneController.text;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SpesaPage(boomerInfo: boomerInfo,)));
                    }
                  });
                },
            ),
          ],
        )
      )
    );
  }
}

