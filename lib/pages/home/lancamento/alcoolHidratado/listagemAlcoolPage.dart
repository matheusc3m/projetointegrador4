import 'package:flutter/material.dart';
import 'package:projeto4/pages/home/lancamento/alcoolHidratado/alcoolController.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class ListagemAlcoolPage extends StatefulWidget {
  @override
  _ListagemAlcoolPageState createState() => _ListagemAlcoolPageState();
}

class _ListagemAlcoolPageState extends State<ListagemAlcoolPage> {
  bool isSwitched = true;
  final AlcoolController controller = AlcoolController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            label: "Cadastrar Álcool Hidratado",
            child: IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed("/home/lancamentos/alcoolHidratado");
              },
              icon: Icon(Icons.add),
            ),
          ),
          SpeedDialChild(
            label: "Cadastrar Destilação",
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/home/lancamentos/destilacao");
              },
              icon: Icon(Icons.add),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text("Meus lançamentos"),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(child: Text("Álcool Hidratado")),
                Switch(
                  inactiveTrackColor: Colors.lightGreen,
                  onChanged: (bool value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                  value: isSwitched,
                ),
                Card(child: Text("Destilação")),
              ],
            ),
            Expanded(
              flex: 8,
              child: FutureBuilder(
                  future: controller.getAlcool(isDistilation: isSwitched),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                      case ConnectionState.none:
                        return Container(
                          width: 200.0,
                          height: 200.0,
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.deepPurple),
                            strokeWidth: 5.0,
                          ),
                        );
                      default:
                        if (snapshot.hasError)
                          return Container(
                            color: Colors.red,
                          );
                        else
                          // return _createStar(context, snapshot);
                          return snapshot.data["lista"].length > 0
                              ? _createStar(context, snapshot)
                              : Center(
                                  child: Text(
                                    "A Lista está vazia!!!",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: "FredokaOne",
                                        fontSize: 30),
                                  ),
                                );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createStar(BuildContext context, AsyncSnapshot snapshot) {
    return ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: snapshot.data["lista"].length,
        itemBuilder: (context, index) {
          var lista = snapshot.data["lista"][index];
          return Container(
            child: Column(
              children: <Widget>[
                Card(
                    child: InkWell(
                  onTap: () {},
                  child: ExpansionTile(
                    trailing: Wrap(
                      children: [
                        IconButton(
                          color: Colors.greenAccent,
                          icon: Icon(Icons.edit),
                          onPressed: () {},
                        ),
                        IconButton(
                          color: Colors.red,
                          icon: Icon(Icons.delete),
                          onPressed: () {},
                        ),
                        IgnorePointer(
                          child: IconButton(
                            icon: Icon(Icons.expand_more_outlined),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    leading: Icon(Icons.supervised_user_circle),
                    title: Text(lista["data"].toString()),
                    children: [
                      isSwitched == true
                          ? Column(
                              children: [
                                ListTile(
                                  title: Text("Porcentagem de perda"),
                                  trailing:
                                      Text(lista["perda"].toString() + "%"),
                                ),
                              ],
                            )
                          : Column(children: [
                              ListTile(title: Text(lista["Ph"].toString()))
                            ])
                    ],
                  ),
                )),
              ],
            ),
          );
        });
  }
}
