import 'package:flutter/material.dart';

class Guindaste extends StatefulWidget {
  @override
  _GuindasteState createState() => _GuindasteState();
}

class _GuindasteState extends State<Guindaste> {
  final formKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  static String _ComprLanca = "";
  static String _ComprPeca = "";
  static double _ResultadoGuindaste = 0.0;

  final myControllerLanca = TextEditingController();
  final myControllerPeca = TextEditingController();

  @override
  void initState() {
    super.initState();
    myControllerLanca.text = "";
    myControllerPeca.text = "";
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    myControllerLanca.dispose();
    myControllerPeca.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      //GUINDASTE

      Expanded(
        flex: 4,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.3,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/guindaste.png'),
                  fit: BoxFit.fill)),
        ),
      ),

      Expanded(
        flex: 4,
        child: Container(
            child: Form(
                key: formKey,
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
                            _ComprLanca = value;
                            print('Valor: ' + _ComprLanca);

                            try {
                              _ResultadoGuindaste = (_ComprLanca.isEmpty
                                          ? 0.0
                                          : double.parse(_ComprLanca)) *
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
                            labelText: 'Comprimento da Lança (m):'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            _ComprPeca = value;
                            _ResultadoGuindaste =
                                double.parse(_ComprLanca) * 1.25 +
                                    (_ComprPeca.isEmpty
                                            ? 0.0
                                            : double.parse(_ComprPeca)) /
                                        2;
                          });
                        },
                        controller: myControllerPeca,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Comprimento da Peça (m):'),
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
                child: (_ComprLanca.isEmpty || _ComprPeca.isEmpty)
                    ? Text('Não deixe campos em branco',
                        style: TextStyle(color: Colors.red))
                    : Text(
                        'Distancia (raio) de Isolamento (m): ' +
                            _ResultadoGuindaste.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))),
      )
    ]));
  }
}
