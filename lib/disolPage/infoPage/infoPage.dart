import 'package:flutter/material.dart';
import 'package:flutter_disol/disolPage/disolPage.dart';
import 'package:flutter_disol/disolPage/infoPage/infoItem.dart';

class InfoPage extends StatelessWidget {
  InfoPage({Key key}) : super(key: key);

  static MaterialPageRoute get route => MaterialPageRoute(
        builder: (context) => InfoPage(),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pushReplacement(Disol.route),
          ),
          title: Text('Informações'),
        ),
        body: Container(
          child: ListView(
            children: [
              InfoItem(
                title: "Desenvolvido por: ",
                height: 125,
                content: "Segurança do Trabalho - Corredor Sul e Centro-Oeste",
                fontSize: 20,
              ),
              SizedBox(
                height: 4,
              ),
              InfoItem(
                title: 'Objetivo: ',
                content:
                    'Calcular as distâncias mínimas das áreas de risco destinada ao içamento de carga, para isolamento e sinalização.',
                height: 200,
                fontSize: 20,
              ),
              SizedBox(
                height: 4,
              ),
              InfoItem(
                title: 'Requisitos Mínimos:',
                content:
                    'PRO 025743 Içamento de carga;\nRAC 5 Içamento de carga item 5.7 Requisitos para procedimentos',
                height: 200,
                fontSize: 20,
              )
            ],
          ),
        ));
  }
}
