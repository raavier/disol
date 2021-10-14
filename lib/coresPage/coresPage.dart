import 'package:flutter/material.dart';
import 'package:flutter_disol/theme/light_color.dart';

class CoresPage extends StatefulWidget {
  const CoresPage({key}) : super(key: key);

  @override
  _CoresPageState createState() => _CoresPageState();
}

class _CoresPageState extends State<CoresPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:
            AppBar(backgroundColor: LightColor.greenVale, title: Text("App")),
      ),
    );
  }
}
