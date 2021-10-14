import 'package:flutter/material.dart';
import 'package:flutter_disol/configs/constants.dart';
import 'package:flutter_disol/disolPage/guindaste.dart';
import 'package:flutter_disol/disolPage/infoPage/infoPage.dart';
import 'package:flutter_disol/disolPage/ponteRolante.dart';
import 'package:flutter_disol/theme/light_color.dart';
import 'package:flutter_disol/theme/theme.dart';

class Disol extends StatefulWidget {
  @override
  _DisolState createState() => _DisolState();

  static MaterialPageRoute get route => MaterialPageRoute(
        builder: (context) => Disol(),
      );
}

class _DisolState extends State<Disol> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // theme: AppTheme.lightTheme,
        /* ThemeData(
          // Define the default brightness and colors.

          primaryColor: Color.fromRGBO(0, 126, 122, 1),

          // Define the default font family.
          fontFamily: 'Georgia',

          // Define the default TextTheme. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic),
            bodyText2: TextStyle(fontSize: 20.0, fontFamily: 'Hind'),
          ),
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: Color.fromRGBO(0, 126, 122, 1)),
        ), */
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                backgroundColor: LightColor.greenVale,
                bottom: TabBar(
                  tabs: [
                    Tab(text: 'Guindaste'),
                    Tab(
                      text: 'Ponte Rolante',
                    )
                  ],
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(3, 0, 15, 0),
                      child: Text('DISOL',
                          style: TextStyle(
                            fontSize: 28,
                          )),
                    ),
                    Center(
                      child: Text(
                        'Distância de Isolamento\n de Carga',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.info),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(InfoPage.route);
                      },
                    )
                  ],
                ),
              ),
              body: SafeArea(
                child: TabBarView(children: [
                  Guindaste(),
                  PonteRolante(),
                ]),
              ),
            )));
  }
}
