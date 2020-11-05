import 'package:flutter/material.dart';
import 'package:flutter_disol/guindaste.dart';
import 'package:flutter_disol/ponteRolante.dart';

class Disol extends StatefulWidget {
  @override
  _DisolState createState() => _DisolState();
}

class _DisolState extends State<Disol> {
  final formKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  static String _ComprLanca = "";
  static String _ComprPeca = "";
  static double _ResultadoGuindaste = 0.0;
  static String _AlturaCarga = "";
  static String _RaioPeca = "";
  static double _ResultadoPonte = 0.0;

  final myControllerLanca = TextEditingController();
  final myControllerPeca = TextEditingController();
  final myControllerAltura = TextEditingController();
  final myControllerRaio = TextEditingController();
  @override
  void initState() {
    super.initState();
    myControllerLanca.text = "";
    myControllerPeca.text = "";
    myControllerAltura.text = "";
    myControllerRaio.text = "";
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    myControllerLanca.dispose();
    myControllerPeca.dispose();
    myControllerAltura.dispose();
    myControllerRaio.dispose();
    super.dispose();
  }

  /* _printLatestValue() {
    print("Second text field: ${myController.text}");
    print("comprimento lanca: " + _ComprLanca);
  } */

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
            length: 2,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                bottom: TabBar(
                  tabs: [
                    Tab(text: 'Guindaste'),
                    Tab(
                      text: 'Ponte Rolante',
                    )
                  ],
                ),
                title: Row(
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
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
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
