import 'package:flutter/material.dart';
import 'package:projeto4/pages/home/lancamento/lancamentoMenuController.dart';

import 'package:projeto4/widgets/customCard.dart';

// ignore: must_be_immutable
class LancamentoMenuPage extends StatelessWidget {
  final controller = LancamentosMenuController();
  var menu = ["Álcool Hidratado", "Destilação"];
  var images = ["assets/alcool.png", "assets/destilacao.png"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lancamentos"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: GridView.builder(
            itemCount: menu.length,
            gridDelegate: (SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 2),
            )),
            itemBuilder: (BuildContext context, int index) {
              return CustomCard(images, menu, context, index,
                  controller.funcNavigation(index));
            }),
      ),
    );
  }
}
