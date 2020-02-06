import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
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
              onPressed: () {},
              child: const Text('CREDENCIAMENTO', style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic)),
            ),
            
            const SizedBox(height: 100),
            RaisedButton(
              color: Colors.white,
              textColor: Colors.black,
              onPressed: () {},
              child: const Text(' PRESENÇA\n        EM\nATIVIDADES', style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic)),
            )

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}