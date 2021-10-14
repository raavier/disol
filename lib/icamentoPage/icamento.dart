import 'package:flutter/material.dart';

class Icamento extends StatefulWidget {
  @override
  _IcamentoState createState() => _IcamentoState();
}

class _IcamentoState extends State<Icamento> {
  final formKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  static String _PesoIcado = "";
  static String _CapacidadeSituacao = "";
  static double _ResultadoIcamento = 0.0;

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
                              _PesoIcado = value;

                              _ResultadoIcamento = (100 *
                                  (_PesoIcado.isEmpty
                                      ? 0.0
                                      : double.parse(_PesoIcado)) /
                                  (double.parse(_CapacidadeSituacao)));
                            })
                          },
                          controller: myControllerAltura,
                          decoration: InputDecoration(
                              labelText: 'Peso Total Içado (em kg) (D):'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              _CapacidadeSituacao = value;
                              _ResultadoIcamento = 100 *
                                  (double.parse(_PesoIcado) /
                                      ((_CapacidadeSituacao.isEmpty
                                          ? 0.0
                                          : double.parse(
                                              _CapacidadeSituacao))));
                            });
                          },
                          controller: myControllerRaio,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText:
                                  'Capacidade da tabela para a situação:'),
                        ),
                      )
                    ],
                  ))),
        ),
        Expanded(
          flex: 3,
          child: Container(
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: (_PesoIcado.isEmpty || _CapacidadeSituacao.isEmpty)
                      ? Text('Não deixe campos em branco',
                          style: TextStyle(color: Colors.red))
                      : (_ResultadoIcamento >= 75)
                          ? Text(
                              'Resultado ' +
                                  _ResultadoIcamento.toString() +
                                  "% Não OK! Aplicar Plano de Rigging",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          : Text(
                              'Resultado: ' +
                                  _ResultadoIcamento.toString() +
                                  "% OK!",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ))),
        )
      ],
    ));
  }
}
