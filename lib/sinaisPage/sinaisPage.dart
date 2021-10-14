import 'package:flutter/material.dart';
import 'package:flutter_disol/configs/constants.dart';
import 'package:flutter_disol/sinaisPage/listSinais.dart';
import 'package:flutter_disol/sinaisPage/sinaisComponent.dart';
import 'package:flutter_disol/theme/light_color.dart';
import 'package:google_fonts/google_fonts.dart';

class SinaisPage extends StatefulWidget {
  const SinaisPage({key}) : super(key: key);

  @override
  _SinaisPageState createState() => _SinaisPageState();
}

class _SinaisPageState extends State<SinaisPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: LightColor.greenVale,
          title: Text(
            "Sinais",
            style: GoogleFonts.openSans(
                textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        backgroundColor: LightColor.grey,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Flexible(
              flex: 1,
              child: Center(
                child: Container(
                  height: 300,
                  child: GridView.count(

                      //childAspectRatio: 1.0,
                      // padding: EdgeInsets.only(left: 10, right: 10),
                      crossAxisCount: 1,
                      //  crossAxisSpacing: 12,
                      //  mainAxisSpacing: 12,
                      children: listSinais
                          .map((data) => SinaisComponent(
                              description: data.description,
                              meaning: data.meaning))
                          .toList()),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
