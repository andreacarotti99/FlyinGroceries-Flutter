import 'package:flutter/material.dart';

  Color primary = Color(0xfff2f0f7);
  Color secondary = Color(0xffffffff);
  Color primaryButtonColor =   Colors.orangeAccent; //HexColor("e74c3c");
  Color secondaryButtonColor = HexColor("212f3c");
    
  TextStyle testi = TextStyle(fontFamily: 'Averta',fontSize: 16.0, color: Colors.black);



  TextStyle headlines = TextStyle(letterSpacing: 2.0,fontSize: 15, color: HexColor("d3d3d3"));
  TextStyle boldNumber = TextStyle(color: HexColor("fbfbfb"), fontWeight: FontWeight.bold,fontSize: 50.0);
  TextStyle secondaryButtonColorStyle = TextStyle(color: secondaryButtonColor, fontWeight: FontWeight.bold,fontSize: 26.0);
  TextStyle primaryButtonStyle = TextStyle( fontSize: 18, fontWeight: FontWeight.normal, letterSpacing: 1,wordSpacing: 2, color: secondaryButtonColor);
  TextStyle resultNumber = TextStyle(color: HexColor("fbfbfb"), fontWeight: FontWeight.bold,fontSize: 80.0,letterSpacing: 0.1);

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

Color color1 = HexColor("b74093");
Color color2 = HexColor("#b74093");
Color color3 = HexColor("#88b74093"); // if you wish to use ARGB format