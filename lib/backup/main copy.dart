import 'package:flutter/material.dart';
import 'package:flutter_disol/disolPage/disolPage.dart';

void main() => runApp(
      MaterialApp(
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
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 60,
              ),
              Container(
                height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/undraw_QA_engineers_dg5p.png'),
                        fit: BoxFit.fill)),
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                padding: EdgeInsets.all(30.0),
                child: Center(
                  child: Text(
                    "Aplicativo para calcular a Distância de Isolamento de Içamento de Carga",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () => {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Disol()))
                  },
                  padding: EdgeInsets.symmetric(horizontal: 120, vertical: 15),
                  textColor: Colors.white,
                  color: Color.fromRGBO(0, 126, 122, 1),
                  child: new Text('Entrar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
