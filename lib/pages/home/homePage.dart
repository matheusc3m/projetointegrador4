import 'package:flutter/material.dart';
import 'package:projeto4/pages/home/homeController.dart';
import 'package:projeto4/widgets/customDrawer.dart';
import 'package:projeto4/widgets/customCard.dart';

class HomePage extends StatelessWidget {
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    var services = ["Lançar informações", "Dashboard"];
    var images = [
      "assets/lancamento.png",
      "assets/dashboard.png",
    ];
    return Scaffold(
      backgroundColor: Color(0xFFF0F0F0),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Bem vindo João",
          style: TextStyle(fontFamily: "FredokaOne"),
        ),
      ),
      drawer: customDrawer(context),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: GridView.builder(
            itemCount: services.length,
            gridDelegate: (SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 2),
            )),
            itemBuilder: (BuildContext context, int index) {
              return CustomCard(
                images,
                services,
                context,
                index,
                controller.funcNavigation(index),
              );
            }),
      ),
    );
  }
}

customListTile(String texto, IconData icon, String pagina, BuildContext context,
    {String screen}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
    child: Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
      child: InkWell(
        splashColor: Colors.lightGreen,
        onTap: () {
          Navigator.of(context).pushNamed(screen);
        },
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(children: <Widget>[
                Icon(
                  icon,
                  color: Theme.of(context).primaryColor,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(texto, style: TextStyle(fontSize: 15.0)),
                ),
              ]),
              Icon(Icons.arrow_right),
            ],
          ),
        ),
      ),
    ),
  );
}
