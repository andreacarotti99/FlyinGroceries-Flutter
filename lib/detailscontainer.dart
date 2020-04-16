

import 'package:flutter/material.dart';

 
// class MyDetailsContainer extends StatefulWidget {
//   List closeBoomersList;
//   int index;
//   MyDetailsContainer({Key key, @required this.closeBoomersList, @required this.index }) : super(key: key);

//   @override
//   _MyDetailsContainerState createState() => _MyDetailsContainerState();
// }

// class _MyDetailsContainerState extends State<MyDetailsContainer>  {
// //   double _scale;
// //   AnimationController _controller;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _controller = AnimationController(
// //       vsync: this,
// //       duration: Duration(milliseconds: 100),
// //       lowerBound: 0.0,
// //       upperBound: 0.1,
// //     )..addListener(() {
// //         setState(() {});
// //       });
// //   }

// //   @override
// //   void dispose() {
// //     _controller.dispose();
// //     super.dispose();
// //   }

// //   void _onTapDown(TapDownDetails details) {
// //     _controller.forward();
// //   }

// //   void _onTapUp(TapUpDetails details) {
// //     _controller.reverse();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     _scale = 1 - _controller.value;

// //     return GestureDetector(
// //       onTapDown: _onTapDown,
// //       onTapUp: _onTapUp,
// //       child: Transform.scale(
// //         scale: _scale,
// //         child: _animatedButtonContainer,
// //       ),
// //     );
// //   }

// // Widget get _animatedButtonContainer => SizedBox(
// //       width: 200,
// //       child: Column(
// //         mainAxisAlignment: MainAxisAlignment.start,
// //         children: <Widget>[
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.start,
// //             children: <Widget> [
// //               Container(
// //                     child: Text(widget.closeBoomersList[widget.index]['nome'].toUpperCase(),
// //                     style: TextStyle(
// //                       color: Colors.black,
// //                       fontFamily: 'Averta',
// //                       fontSize: 28.0,
// //                       fontWeight: FontWeight.bold
// //                     ),
// //                 )
// //               ),
// //               ]
// //           ),
// //               Row(
// //                 children: <Widget>[
// //                   SizedBox(height: 10.0),
// //                 ],
// //               ),
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.start,
// //                 children: <Widget>[
// //                   Container(
// //                     child: Row(
// //                       children: <Widget>[
// //                         Container(width: 24.0, height: 24.0, child: Icon(Icons.phone, color: Colors.green[300],)),
// //                         SizedBox(width: 8.0),
// //                         Text(
// //                           widget.closeBoomersList[widget.index]["telefono"].toString(),
// //                           style: TextStyle(
// //                             color: Colors.black54,
// //                             fontSize: 22.0,
// //                             fontWeight: FontWeight.bold
// //                           ),
// //                         ),
// //                       ],
// //                     )
// //                   ),
// //                 ],
// //               ),
// //               SizedBox(height: 10.0),
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.start,
// //                 children: <Widget>[
// //                   Text('< 3 Km da te', style: TextStyle(color: Colors.black, fontFamily: 'Averta', fontSize: 14.0),),
// //                 ],
// //               )
// //         ],
// //       ),
// //     );
// //   }


Widget myDetailsContainer(String boomerName, int index, List usersData) {
    return SizedBox(
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget> [
              Container(
                    child: Text(boomerName.toUpperCase(),
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Averta',
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold
                    ),
                )
              ),
              ]
          ),
              Row(
                children: <Widget>[
                  SizedBox(height: 10.0),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Container(width: 24.0, height: 24.0, child: Icon(Icons.phone, color: Colors.green[300],)),
                        SizedBox(width: 8.0),
                        Text(
                          usersData[index]["telefono"].toString(),
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    )
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('< 3 Km da te', style: TextStyle(color: Colors.black, fontFamily: 'Averta', fontSize: 14.0),),
                ],
              )
        ],
      ),
    );
  }