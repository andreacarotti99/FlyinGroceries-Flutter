import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:VoloSpesa/mappage.dart';
import 'package:url_launcher/url_launcher.dart';


class BottoneUi extends StatelessWidget {
  String phoneNumber;
  BottoneUi({Key key, @required this.phoneNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
    elevation: 6.0,
    shadowColor: Colors.black45,
    shape: StadiumBorder(),
    clipBehavior: Clip.antiAlias,
    color: Colors.green[200],
    child: InkWell(
      onTap: () {
        _launchURL(phoneNumber);
        Navigator.of(context).pop();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32.0,
              vertical: 12.0,
            ),
            child: Text(
              'CHIAMA',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    ),
  );
  }
}

void _launchURL(String number) async {
  var url = 'tel:$number';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}