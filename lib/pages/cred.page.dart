import 'package:flutter/material.dart';

class CredPage extends StatefulWidget {
  @override
  _CredPageState createState() => _CredPageState();
}

class _CredPageState extends State<CredPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(
        title: Text("Credenciamento"),
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
              },
              child: const Text('DIA 24', style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic)),
            ),
            Divider(height: 50),

            const SizedBox(height: 0),
            RaisedButton(
              color: Colors.white,
              textColor: Colors.black,
              onPressed: () {
              },
              child: const Text('DIA 25', style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic)),
            ),
            Divider(height: 50),

            const SizedBox(height: 0),
            RaisedButton(
              color: Colors.white,
              textColor: Colors.black,
              onPressed: () {
              },
              child: const Text('DIA 26', style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic)),
            ),
            Divider(height: 50),

            const SizedBox(height: 0),
            RaisedButton(
              color: Colors.white,
              textColor: Colors.black,
              onPressed: () {
              },
              child: const Text('DIA 27', style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic)),
            ),
            Divider(height: 50),
            
            const SizedBox(height: 0),
            RaisedButton(
              color: Colors.white,
              textColor: Colors.black,
              onPressed: () {
              },
              child: const Text('DIA 28', style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic)),
            ),

          ]
        )
      )
      
    );
  }
}