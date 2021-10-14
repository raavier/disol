import 'package:flutter/material.dart';
import 'package:flutter_disol/cintaPage/cintaPage.dart';
import 'package:flutter_disol/coresPage/coresPage.dart';

import 'package:flutter_disol/disolPage/disolPage.dart';
import 'package:flutter_disol/icamentoPage/icamentoPage.dart';
import 'package:flutter_disol/sinaisPage/sinaisPage.dart';
import 'package:flutter_disol/theme/light_color.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class GridDashboard extends StatelessWidget {
  ItemsHomeGrid item1 = new ItemsHomeGrid(
      title: "Disol",
      subtitle: "Distância de Isolamento",
      event: "",
      page: Disol(),
      img: "assets/images/disol_novo.png");

  ItemsHomeGrid item2 = new ItemsHomeGrid(
    title: "Içamento",
    subtitle: "Cálculo de Riggings",
    event: "",
    page: IcamentoPage(),
    img: "assets/images/icamento.png",
  );
/*   ItemsHomeGrid item3 = new ItemsHomeGrid(
    title: "Mataco",
    subtitle: "Mataco",
    event: "",
    img: "assets/images/map.png",
  ); */
  ItemsHomeGrid item4 = new ItemsHomeGrid(
    title: "Cinta",
    subtitle: "Angulo das Cintas",
    event: "",
    page: CintaPage(),
    img: "assets/images/cinta.png",
  );
  ItemsHomeGrid item5 = new ItemsHomeGrid(
    title: "Cores",
    subtitle: "Tabela de Cores",
    event: "4 ItemsHomeGrid",
    page: CoresPage(),
    img: "assets/images/cores.png",
  );
  ItemsHomeGrid item6 = new ItemsHomeGrid(
    title: "Sinais",
    subtitle: "Sinais de Segurança",
    event: "2 ItemsHomeGrid",
    page: SinaisPage(),
    img: "assets/images/sinais.png",
  );

  @override
  Widget build(BuildContext context) {
    List<ItemsHomeGrid> myList = [item1, item2, /*  item3, */ item4, item5, item6];
    var color = 0xFFFFFFFF;
    return Container(
      child: Flexible(
        child: GridView.count(
            childAspectRatio: 1.0,
            padding: EdgeInsets.only(left: 18, right: 18),
            crossAxisCount: 2,
            crossAxisSpacing: 18,
            mainAxisSpacing: 18,
            children: myList.map((data) {
              return GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => data.page)),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(color),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(data.img, width: 80),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            data.title,
                            style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            data.subtitle,
                            style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ),
                        Text(
                          data.event,
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList()),
      ),
    );
  }
}

class ItemsHomeGrid {
  String title;
  String subtitle;
  String event;
  String img;
  Widget page;
  ItemsHomeGrid({this.title, this.subtitle, this.event, this.img, this.page});
}
