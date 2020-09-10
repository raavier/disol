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
  static double _Resultado = 0.0;

  final myControllerLanca = TextEditingController();
  @override
  void initState() {
    super.initState();
    myControllerLanca.addListener(_printLatestValue);
    myControllerLanca.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    myControllerLanca.dispose();
    super.dispose();
  }

  _printLatestValue() {
    print("Second text field: ${myController.text}");
    print("comprimento lanca: " + _ComprLanca);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: 'Guindaste'),
              Tab(
                text: 'Ponte Rolante',
              )
            ],
          ),
          title: Text('DISOL - Distancia de Isolamento de Carga'),
        ),
        body: SafeArea(
          child: TabBarView(children: [
            Column(
              children: [
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

                                    _Resultado = double.parse(_ComprLanca) +
                                        double.parse(_ComprPeca);
                                    print('Valor Resultado ' +
                                        _Resultado.toString());
                                  })
                                },
                                controller: myController,
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
                                    _Resultado = double.parse(_ComprLanca) +
                                        double.parse(_ComprPeca);
                                  });
                                },
                                controller: myController,
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
                            child: Text(_ComprLanca.isEmpty
                                ? 'vazio'
                                : 'Valor: ' + _Resultado.toString())))),
              ],
            ),
            Container(
              color: Colors.blueGrey,
              child: Center(
                child: Text(
                  "Segunda guia",
                  style: TextStyle(),
                ),
              ),
            )
          ]),
        ),
      ),
    ));
  }
}
