import 'package:flutter/material.dart';
//import 'package:qrcode_reader/qrcode_reader.dart';
import 'package:barcode_scan/barcode_scan.dart';

class CredPage extends StatefulWidget {
  @override
  _CredPageState createState() => _CredPageState();
}

class _CredPageState extends State<CredPage> {

  int day;

  void _exibirDialogo() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Credenciado com sucesso no dia $day"),
          content: new Text("pressione ok para continuar credenciando"),
          actions: <Widget>[
            // define os botões na base do dialogo
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
                _scanQR();
              },
            ),
          ],
        );
      },
    );
  }

  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      Future.delayed(const Duration(seconds: 2), () => "2");
      print(qrResult);
      _exibirDialogo();
    } finally {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[200],
        appBar: AppBar(
          title: Text("Credenciamento"),
        ),
        body: Center ( 
          child: buildListViewButtons(),
        ));
  }

  buildListViewButtons(){
        return ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(100.0),
          children: <Widget>[
            const SizedBox(height: 0),
              RaisedButton(
                color: Colors.white,
                textColor: Colors.black,
                onPressed: (){
                  day = 24;
                  _scanQR();
                  },
                child: const Text('DIA 24',
                    style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic)),
              ),
              //Divider(height: 50),
              const SizedBox(height: 20),
              RaisedButton(
                color: Colors.white,
                textColor: Colors.black,
                onPressed:(){
                  day = 25;
                  _scanQR();
                  },
                child: const Text('DIA 25',
                    style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic)),
              ),
              //Divider(height: 50),
              const SizedBox(height: 20),
              RaisedButton(
                color: Colors.white,
                textColor: Colors.black,
                onPressed:(){
                  day = 26;
                  _scanQR();
                },
                child: const Text('DIA 26',
                    style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic)),
              ),
              //Divider(height: 50),
              const SizedBox(height: 20),
              RaisedButton(
                color: Colors.white,
                textColor: Colors.black,
                onPressed:(){
                  day = 27;
                  _scanQR();
                },
                child: const Text('DIA 27',
                    style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic)),
              ),
              //Divider(height: 50),
              const SizedBox(height: 20),
              RaisedButton(
                color: Colors.white,
                textColor: Colors.black,
                onPressed:(){
                  day = 28;
                  _scanQR();
                },
                child: const Text('DIA 28',
                  style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic))
          ),
      ],

    );
  }
}
