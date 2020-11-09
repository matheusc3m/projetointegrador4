import 'package:flutter/material.dart';
import 'package:projeto4/pages/home/dashboard/dashboardPage.dart';
import 'package:projeto4/pages/home/homePage.dart';

import 'package:projeto4/pages/login/loginPage.dart';
import 'package:projeto4/pages/login/signupPage.dart';

import 'pages/home/lancamento/alcoolHidratado/alcooHidratadoPage.dart';
import 'pages/home/lancamento/lancamentoMenuPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        buttonColor: Colors.green,
        brightness: Brightness.light,
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/home': (context) => HomePage(),
        '/home/lancamentos': (context) => LancamentoMenuPage(),
        '/home/lancamentos/alcoolHidratado': (context) => AlcoolHidratadoPage(),
        '/home/dashboard': (context) => DashboardPage(),
      },
    );
  }
}
