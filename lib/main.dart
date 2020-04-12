import 'package:flutter/material.dart';

import 'pages/cred.page.dart';
import 'pages/home.page.dart';
import 'pages/splashScreen.page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Semana da Computação',
      theme: ThemeData(
//        primarySwatch: MaterialColor..fromRGBO(0x10, 0x15, 0x4A, 1),
        primaryColor: Color.fromRGBO(0x10, 0x15, 0x4A, 1),
      ),
      //home: CredPage()
      home:SplashScreenPage(),
    );
  }
}
