import 'package:flutter/material.dart';
import 'package:flutter_disol/configs/constants.dart';
import 'package:flutter_disol/theme/light_color.dart';
import 'package:google_fonts/google_fonts.dart';

class SinaisComponent extends StatelessWidget {
  final String description;
  final String meaning;

  SinaisComponent({Key key, @required this.description, @required this.meaning})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Center(
        child: Container(
          // width: double.infinity,
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              )
            ],
            color: white,
          ),
          // color: white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
                child: Text("Descrição do Sinal:",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontSize: 20,
                            color: LightColor.greyDark,
                            fontWeight: FontWeight.w600))),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 5, 15),
                child: Text(description,
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontSize: 17,
                            color: LightColor.greyDark,
                            fontWeight: FontWeight.w400))),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
                child: Text("Significado do Sinal:",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontSize: 20,
                            color: LightColor.greyDark,
                            fontWeight: FontWeight.w600))),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 5, 15),
                child: Text(meaning,
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontSize: 17,
                            color: LightColor.greyDark,
                            fontWeight: FontWeight.w400))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
