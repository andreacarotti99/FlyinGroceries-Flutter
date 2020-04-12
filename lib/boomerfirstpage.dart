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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  'Compila i campi qua sotto e premi CONTINUA', 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Averta',
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                    color: Colors.black
                  )
                ),
              ),
              SizedBox(height: 10.0),
              
              Form(
                key: _formKey,
                child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 400,
                      height: 60,
                          decoration: BoxDecoration(
                            color: secondary,
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                          child: Row(
                            children: <Widget>[
                              SizedBox(width: 20.0,),
                              Icon(Icons.person_outline, size: 20.0, color: Colors.grey),
                              SizedBox(width: 10.0,),
                              Container(
                                decoration: BoxDecoration(color: Colors.grey),
                                width: 1.0,
                                height: 30.0,
                              ),
                              SizedBox(width: 10.0,),
                              SizedBox(
                                width: 200,
                                child: TextFormField(
                                  style: TextStyle(color: Colors.black),
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
                            ],
                          ),
                    ),
                    Container(
                      width: 400,
                      height: 60,
                          decoration: BoxDecoration(
                            color: secondary,
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                          child: Row(
                            children: <Widget>[
                              SizedBox(width: 20.0,),
                              Icon(Icons.phone, size: 20.0, color: Colors.grey),
                              SizedBox(width: 10.0,),
                              Container(
                                decoration: BoxDecoration(color: Colors.grey),
                                width: 1.0,
                                height: 30.0,
                              ),
                              SizedBox(width: 10.0,),
                              SizedBox(
                                width: 200,
                                child: TextFormField(
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Inserisci il tuo telefono',
                                    hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                  controller: _phoneController,
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return 'Premi lo spazio bianco e poi digita il tuo telefono';
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                    ),
                    Container(
                      width: 400,
                      height: 60,
                          decoration: BoxDecoration(
                            color: secondary,
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                          child: Row(
                            children: <Widget>[
                              SizedBox(width: 20.0,),
                              Icon(Icons.home, size: 20.0, color: Colors.grey),
                              SizedBox(width: 10.0,),
                              Container(
                                decoration: BoxDecoration(color: Colors.grey),
                                width: 1.0,
                                height: 30.0,
                              ),
                              SizedBox(width: 10.0,),
                              SizedBox(
                                width: 200,
                                child: TextFormField(
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Inserisci il tuo indirizzo',
                                    hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                  controller: _addressController,
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return 'Perfavore inserisci il tuo indirizzo: premi lo spazio bianco e poi digita il tuo indirizzo';
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                    ), 
                  ],
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
                  color: Colors.blue,
                  child: InkWell(
                    onTap: () {
                
                    setState(() {
                      if (_formKey.currentState.validate()) {
                        boomerInfo.name = _nameController.text;
                        boomerInfo.address = _addressController.text;
                        boomerInfo.phone = _phoneController.text;
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SpesaPage(boomerInfo: boomerInfo,)));
                      }
                    });      
                      
                      //deleteMarker(usersData[i]["nome"], usersData[i]["telefono"],usersData[i]["indirizzo"],usersData[i]["spesa"]);                                  
                      //delete request
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
        )
      )
    );
  }
}

