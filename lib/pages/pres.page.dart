import 'package:flutter/material.dart';

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

          /*
        Column(
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
        */
        ));
  }

  buildListViewButtons() {
    return ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(100.0),
        children: <Widget>[
          const SizedBox(height: 0),
          RaisedButton(
            color: Colors.white,
            textColor: Colors.black,
            onPressed: () {},
            child: const Text('DIA 24',
                style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic)),
          ),
          //Divider(height: 50),
          const SizedBox(height: 20),
          RaisedButton(
            color: Colors.white,
            textColor: Colors.black,
            onPressed: () {},
            child: const Text('DIA 25',
                style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic)),
          ),
          //Divider(height: 50),
          const SizedBox(height: 20),
          RaisedButton(
            color: Colors.white,
            textColor: Colors.black,
            onPressed: () {},
            child: const Text('DIA 26',
                style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic)),
          ),
          //Divider(height: 50),
          const SizedBox(height: 20),
          RaisedButton(
            color: Colors.white,
            textColor: Colors.black,
            onPressed: () {},
            child: const Text('DIA 27',
                style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic)),
          ),
          //Divider(height: 50),
          const SizedBox(height: 20),
          RaisedButton(
            color: Colors.white,
            textColor: Colors.black,
            onPressed: () {},
            child: const Text('DIA 28',
                style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic)),
          ),
        ]);
  }
}
