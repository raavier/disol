import 'dart:wasm';

import 'package:flutter/material.dart';
import 'package:flutter_disol/theme/light_color.dart';
import 'package:flutter_disol/theme/text_styles.dart';
import 'package:flutter_disol/theme/theme.dart';

class Disol extends StatefulWidget {
  @override
  _DisolState createState() => _DisolState();
}

class _DisolState extends State<Disol> {
  final formKey = GlobalKey<FormState>();
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
                      'Distância de Isolamento de Carga',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  )
                ],
              ),
            ),
            body: SafeArea(
              child: TabBarView(children: [
                Column(children: [
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/guindaste.png'),
                            fit: BoxFit.fill)),
                  ),
                  Container(
                      child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) => {
                                    setState(() {
                                      _ComprLanca = value;
                                      print('Valor: ' + _ComprLanca);

                                      try {
                                        _ResultadoGuindaste =
                                            (_ComprLanca.isEmpty
                                                        ? 0.0
                                                        : double.parse(
                                                            _ComprLanca)) *
                                                    1.25 +
                                                double.parse(_ComprPeca) / 2;
                                      } catch (e) {
                                        print(e);
                                      }

                                      print('Valor Resultado ' +
                                          _ResultadoGuindaste.toString());
                                    })
                                  },
                                  controller: myControllerLanca,
                                  decoration: InputDecoration(
                                      labelText: 'Comprimento da Lança'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: TextFormField(
                                  onChanged: (value) {
                                    setState(() {
                                      _ComprPeca = value;
                                      _ResultadoGuindaste =
                                          double.parse(_ComprLanca) * 1.25 +
                                              (_ComprPeca.isEmpty
                                                      ? 0.0
                                                      : double.parse(
                                                          _ComprPeca)) /
                                                  2;
                                    });
                                  },
                                  controller: myControllerPeca,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      labelText: 'Comprimento da Peça'),
                                ),
                              )
                            ],
                          ))),
                  Container(
                      child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Expanded(
                              child: (_ComprLanca.isEmpty || _ComprPeca.isEmpty)
                                  ? Text('Não deixe campos em branco',
                                      style: TextStyle(color: Colors.red))
                                  : Text(
                                      'Distancia de Isolamento: ' +
                                          _ResultadoGuindaste.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ))))
                ]),
                Column(
                  children: [
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/ponte.png'),
                              fit: BoxFit.fill)),
                    ),
                    Container(
                        child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) => {
                                      setState(() {
                                        _AlturaCarga = value;

                                        _ResultadoGuindaste = (_AlturaCarga
                                                    .isEmpty
                                                ? 0.0
                                                : double.parse(_AlturaCarga)) +
                                            double.parse(_RaioPeca);
                                      })
                                    },
                                    controller: myControllerAltura,
                                    decoration: InputDecoration(
                                        labelText:
                                            'Altura da Movimentação da Carga'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: TextFormField(
                                    onChanged: (value) {
                                      setState(() {
                                        _RaioPeca = value;
                                        _ResultadoPonte =
                                            double.parse(_AlturaCarga) +
                                                (_RaioPeca.isEmpty
                                                    ? 0.0
                                                    : double.parse(_RaioPeca));
                                      });
                                    },
                                    controller: myControllerRaio,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        labelText: 'Raio da Peça'),
                                  ),
                                )
                              ],
                            ))),
                    Container(
                        child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Expanded(
                                child:
                                    (_AlturaCarga.isEmpty || _RaioPeca.isEmpty)
                                        ? Text('Não deixe campos em branco',
                                            style: TextStyle(color: Colors.red))
                                        : Text(
                                            'Distancia de Isolamento: ' +
                                                _ResultadoPonte.toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ))))
                  ],
                ),
              ]),
            ),
          ),
        ));
  }
}
