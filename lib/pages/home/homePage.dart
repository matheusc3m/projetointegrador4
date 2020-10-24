import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto4/pages/table/tablePage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var services = ["Lançar informações", "Dashboard", "Opção 3", "Opção 4"];
    var images = [
      "lib/images/icons/fornecedor.png",
      "lib/images/icons/dashboard.png",
      "lib/images/icons/lancamento.png",
      "lib/images/icons/qrcode.png",
    ];
    return Scaffold(
      backgroundColor: Color(0xFFF0F0F0),
      appBar: AppBar(
        title: Text("Bem vindo João"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: <Color>[
                  Colors.green[700],
                  Colors.green[600],
                  Colors.green
                ])),
                child: CircleAvatar(
                    backgroundColor: Colors.white70,
                    child: Icon(
                      Icons.supervised_user_circle,
                      size: 100,
                    ))),
            CustomListTile(
                "Editar Minhas Informações", Icons.business, "editar", context),
            CustomListTile("Sobre", Icons.info, "sobre", context),
            CustomListTile("Logout", Icons.lock, "logout", context, screen: "/")
          ],
        ),
      ),
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
              return Card(
                child: InkWell(
                  onTap: () {
                    Get.to(TablePage());
                  },
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Image.asset(images[index], height: 50, width: 50),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          services[index],
                          style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.025,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}

CustomListTile(String texto, IconData icon, String pagina, BuildContext context,
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
