import 'package:flutter/material.dart';
import 'package:projeto4/pages/lancamento/lancamentoMenuPage.dart';
import 'package:projeto4/pages/table/tablePage.dart';

Widget customCard(List<String> images, List<String> texts, BuildContext context,
    int index, String tipo, Function() func) {
  return Card(
    semanticContainer: true,
    child: InkWell(
      onTap: func,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: MediaQuery.of(context).size.height * 0.01,
            left: MediaQuery.of(context).size.height * 0.01,
            child: Image.asset(
              images[index],
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height * 0.22,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.01,
            left: MediaQuery.of(context).size.height * 0.03,
            child: Text(
              texts[index],
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.021,
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
}
