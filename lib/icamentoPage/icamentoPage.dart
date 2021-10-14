import 'package:flutter/material.dart';
import 'package:flutter_disol/disolPage/guindaste.dart';
import 'package:flutter_disol/IcamentoPage/Icamento.dart';
import 'package:flutter_disol/disolPage/infoPage/infoPage.dart';
import 'package:flutter_disol/disolPage/ponteRolante.dart';

class IcamentoPage extends StatefulWidget {
  @override
  _IcamentoState createState() => _IcamentoState();

  static MaterialPageRoute get route => MaterialPageRoute(
        builder: (context) => IcamentoPage(),
      );
}

class _IcamentoState extends State<IcamentoPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          // Define the default brightness and colors.

          primaryColor: Color.fromRGBO(0, 126, 122, 1),
          accentColor: Colors.cyan[600],

          // Define the default font family.
          fontFamily: 'Georgia',

          // Define the default TextTheme. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic),
            bodyText2: TextStyle(fontSize: 20.0, fontFamily: 'Hind'),
          ),
        ),
        home: DefaultTabController(
            length: 1,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                bottom: TabBar(
                  tabs: [
                    Tab(text: 'Içamento Básico'),
                  ],
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(3, 0, 15, 0),
                      child: Text('DISOL',
                          style: TextStyle(
                            fontSize: 40,
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
                  Icamento(),
                ]),
              ),
            )));
  }
}
