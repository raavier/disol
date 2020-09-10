import 'package:flutter/material.dart';
import 'package:flutter_disol/disolPage.dart';

void main() => runApp(
      MaterialApp(
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
                    "O uso deste aplicativo se dá apenas durante o horário de trabalho",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              RaisedButton(
                onPressed: () => {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Disol()))
                },
                padding: EdgeInsets.symmetric(horizontal: 120, vertical: 15),
                textColor: Colors.white,
                color: Color.fromRGBO(0, 126, 122, 1),
                child: new Text('Entrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
