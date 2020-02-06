import 'package:flutter/material.dart';

import 'pages/cred.page.dart';
import 'pages/home.page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      //home: CredPage()
      home: MyHomePage(title: 'Semana da Computação'),
    );
  }
}
