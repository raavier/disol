import 'package:flutter/material.dart';
import 'package:flutter_disol/configs/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoItem extends StatelessWidget {
  final String title;
  final String content;
  final double height;
  final double fontSize;

  InfoItem(
      {Key key,
      @required this.title,
      @required this.content,
      @required this.height,
      @required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: height,
        margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: shadow,
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(color: Colors.grey, width: 1.0),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: itemTitle,
                ),
                SizedBox(
                  height: 8.0,
                ),
                Center(
                  child: Text(content,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: fontSize,
                          color: grey2,
                        ),
                      )),
                )
              ],
            ),
          ),
        ));
  }
}
