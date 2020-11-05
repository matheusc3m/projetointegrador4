import 'package:flutter/material.dart';

class HomeController {
  Function funcPrincipal(int index, BuildContext context) {
    if (index == 0) Navigator.of(context).pushNamed("/home/lancamentos");
    if (index == null) print("vsf");
  }
}
