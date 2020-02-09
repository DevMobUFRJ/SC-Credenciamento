import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'database/activities.page.dart';

class PresPage extends StatefulWidget {
  @override
  _PresPageState createState() => _PresPageState();
}

class _PresPageState extends State<PresPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[200],
        appBar: AppBar(
          title: Text("Presença em Atividades"),
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AtivPage(23)),
            );
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AtivPage(24)),
            );
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AtivPage(25)),
            );
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AtivPage(26)),
            );
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AtivPage(27)),
            );
          },
          child: const Text('DIA 27',
              style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic)),
        ),
      ],
    );
  }
}

class AtivPage extends StatefulWidget {

  String day;

  AtivPage(int day){
    this.day = "Dia $day";
  }

  @override
  AtivPageState createState() => AtivPageState(day);
}

class AtivPageState extends State<AtivPage> {

  String day;

  AtivPageState(String day){
    this.day = day;
  }

  void exibirDialogo(BuildContext context2, String atividade, CollectionReference credCollection) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Presença confirmada na atividade $atividade"),
          content: new Text("Pressione ok para continuar dando presenças"),
          actions: <Widget>[
            // define os botões na base do dialogo
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
                scanQR(context2, atividade, credCollection);
              },
            ),
            /*new FlatButton(
              child: new Text("Cancelar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),*/
          ],
        );
      },
    );
  }

  void exibirDialogoErr(BuildContext context2, String atividade, CollectionReference credCollection) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("QR Code inválido"),
          content: new Text("Pressione ok para continuar dando presenças"),
          actions: <Widget>[
            // define os botões na base do dialogo
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
                scanQR(context2, atividade, credCollection);
              },
            ),
          ],
        );
      },
    );
  }

  Future scanQR(BuildContext context2, String atividade, CollectionReference credCollection) async {
    try {
      String qrResult = await BarcodeScanner.scan();
      RegExp qrcodeRegex = RegExp(r'^SC-[0-9]{1,}');
      //Future.delayed(const Duration(seconds: 2), () => "2");
      print(qrResult);
      if(qrcodeRegex.hasMatch(qrResult)){
        exibirDialogo(context2, atividade, credCollection);
        await ActivitiesList(this.day).updateUserData(credCollection, qrResult);
      }else{
        exibirDialogoErr(context2, atividade, credCollection);
      }
    } finally {}
  }

  List<String> atividades = [
    "Atividade 1",
    "Atividade 2",
    "Atividade 3",
    "Atividade 4",
    "Atividade 5",
    "Atividade 6",
    "Atividade 7",
    "Atividade 8",
    "Atividade 9",
    "Atividade 10",
    "Atividade 11",
    "Atividade 12"
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(
        title: Text("Presença em Atividades"),
      ),
      body: ActivitiesList(this.day),
    );

    /*
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(
        title: Text("Presença em Atividades"),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(atividades[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.camera, color: Colors.blue),
                    onPressed: () {
                      _scanQR(atividades[index]);
                    },
                  ),
                  leading: Icon(
                    Icons.label_important,
                    color: Colors.blueGrey,
                  ),
                );
              },
              itemCount: atividades.length,
            )),
          ]),
    );*/
  }

}




