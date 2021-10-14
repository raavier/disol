import 'package:flutter/material.dart';

class PonteRolante extends StatefulWidget {
  @override
  _PonteRolanteState createState() => _PonteRolanteState();
}

class _PonteRolanteState extends State<PonteRolante> {
  final formKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  static String _AlturaCarga = "";
  static String _RaioPeca = "";
  static double _ResultadoPonte = 0.0;

  final myControllerAltura = TextEditingController();
  final myControllerRaio = TextEditingController();
  @override
  void initState() {
    super.initState();
    myControllerAltura.text = "";
    myControllerRaio.text = "";
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    myControllerAltura.dispose();
    myControllerRaio.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (Column(
      children: [
        //PONTE
        Expanded(
          flex: 4,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/ponte.png'),
                        fit: BoxFit.fill)),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
              child: Form(
                  key: formKey2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          onChanged: (value) => {
                            setState(() {
                              _AlturaCarga = value;

                              _ResultadoPonte = (_AlturaCarga.isEmpty
                                      ? 0.0
                                      : double.parse(_AlturaCarga)) +
                                  double.parse(_RaioPeca);
                            })
                          },
                          controller: myControllerAltura,
                          decoration: InputDecoration(
                              labelText:
                                  'Altura da Movimentação da Carga (m):'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              _RaioPeca = value;
                              _ResultadoPonte = double.parse(_AlturaCarga) +
                                  (_RaioPeca.isEmpty
                                      ? 0.0
                                      : double.parse(_RaioPeca));
                            });
                          },
                          controller: myControllerRaio,
                          keyboardType: TextInputType.number,
                          decoration:
                              InputDecoration(labelText: 'Raio da Peça (m):'),
                        ),
                      )
                    ],
                  ))),
        ),
        Expanded(
          flex: 2,
          child: Container(
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: (_AlturaCarga.isEmpty || _RaioPeca.isEmpty)
                      ? Text('Não deixe campos em branco',
                          style: TextStyle(color: Colors.red))
                      : Text(
                          'Distancia de Isolamento (m): ' +
                              _ResultadoPonte.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))),
        )
      ],
    ));
  }
}
