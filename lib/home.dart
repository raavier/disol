import 'package:flutter/material.dart';
import 'package:flutter_disol/configs/constants.dart';
import 'package:flutter_disol/griddashboard.dart';
import 'package:flutter_disol/theme/light_color.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  static MaterialPageRoute get route => MaterialPageRoute(
        builder: (context) => Home(),
      );

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColor.greenVale,
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 30, bottom: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "GUIA RAC 5",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Divider(
              color: white,
              height: 15,
              thickness: 3,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GridDashboard()
        ],
      ),
    );
  }
}
