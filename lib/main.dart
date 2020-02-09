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
        primarySwatch: Colors.red,
      ),
      //home: CredPage()
      home:SplashScreenPage(),
    );
  }
}
