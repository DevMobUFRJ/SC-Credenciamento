import 'package:flutter/material.dart';
import 'package:sc_credenciamento/pages/cred.page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'pres.page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _exibirDialogo() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Sincronização Concluída"),
          content: new Text("Pressione ok para continuar"),
          actions: <Widget>[
            // define os botões na base do dialogo
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _sync() async{
    await Firestore.instance.collection("Atividades").document("Sync").setData({
    });
    _exibirDialogo(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 0),
            RaisedButton(
              color: Colors.white,
              textColor: Colors.black,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CredPage()),
                );
              },
              child: const Text('CREDENCIAMENTO',
                  style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic)),
            ),
            const SizedBox(height: 100),
            RaisedButton(
              color: Colors.white,
              textColor: Colors.black,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PresPage()),
                );
              },
              child: const Text(' PRESENÇA\n        EM\nATIVIDADES',
                  style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic)),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sync,
        tooltip: 'Sincronizar',
        child: Icon(Icons.autorenew),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
