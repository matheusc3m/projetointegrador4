import 'package:flutter/material.dart';
import 'package:projeto4/pages/home/homePage.dart';

Widget customDrawer(BuildContext context) {
  return Drawer(
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
        customListTile(
            "Editar Minhas Informações", Icons.business, "editar", context),
        customListTile("Sobre", Icons.info, "sobre", context),
        customListTile("Logout", Icons.lock, "logout", context, screen: "/")
      ],
    ),
  );
}
