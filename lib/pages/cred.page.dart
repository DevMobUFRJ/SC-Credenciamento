import 'package:flutter/material.dart';
//import 'package:qrcode_reader/qrcode_reader.dart';
import 'package:barcode_scan/barcode_scan.dart';

import 'database/database.page.dart';

class CredPage extends StatefulWidget {
  @override
  _CredPageState createState() => _CredPageState();
}

class _CredPageState extends State<CredPage> {
  void _exibirDialogo(int day) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Credenciado com sucesso no dia $day"),
          content: new Text("Pressione ok para continuar credenciando"),
          actions: <Widget>[
            // define os botões na base do dialogo
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
                _scanQR(day);
              },
            ),
          ],
        );
      },
    );
  }

  void _exibirDialogoErr(int day) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("QR Code inválido"),
          content: new Text("Pressione ok para continuar credenciando"),
          actions: <Widget>[
            // define os botões na base do dialogo
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
                _scanQR(day);
              },
            ),
          ],
        );
      },
    );
  }

  Future _scanQR(int day) async {
    try {
      String qrResult = await BarcodeScanner.scan();
      RegExp qrcodeRegex = RegExp(r'^SC-[0-9]{1,}');
      //Future.delayed(const Duration(seconds: 2), () => "2");
      print(qrResult);
      if(qrcodeRegex.hasMatch(qrResult)){
        _exibirDialogo(day);
        await DatabaseService(day).updateUserData(qrResult);
      }else{
        _exibirDialogoErr(day);
      }

    } finally {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[200],
        appBar: AppBar(
          title: Text("Credenciamento"),
        ),
        body: Center(
          child: buildListViewButtons(),
        ));
  }

  buildListViewButtons() {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(100.0),
      children: <Widget>[
        const SizedBox(height: 20),
        RaisedButton(
          color: Colors.white,
          textColor: Colors.black,
          onPressed: () {
            _scanQR(23);
          },
          child: const Text('DIA 23',
              style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic)),
        ),
        //Divider(height: 50),
        const SizedBox(height: 20),
        RaisedButton(
          color: Colors.white,
          textColor: Colors.black,
          onPressed: () {
            _scanQR(24);
          },
          child: const Text('DIA 24',
              style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic)),
        ),
        //Divider(height: 50),
        const SizedBox(height: 20),
        RaisedButton(
          color: Colors.white,
          textColor: Colors.black,
          onPressed: () {
            _scanQR(25);
          },
          child: const Text('DIA 25',
              style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic)),
        ),
        //Divider(height: 50),
        const SizedBox(height: 20),
        RaisedButton(
          color: Colors.white,
          textColor: Colors.black,
          onPressed: () {
            _scanQR(26);
          },
          child: const Text('DIA 26',
              style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic)),
        ),
        //Divider(height: 50),
        const SizedBox(height: 20),
        RaisedButton(
          color: Colors.white,
          textColor: Colors.black,
          onPressed: () {
            _scanQR(27);
          },
          child: const Text('DIA 27',
              style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic)),
        ),
      ],
    );
  }
}
