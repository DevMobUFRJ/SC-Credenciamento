import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../pres.page.dart';

class ActivitiesList extends StatelessWidget {

  String day;

  ActivitiesList(String day){
    this.day = day;
  }

  Future updateUserData(CollectionReference credCollection, String ID) async {
    return await credCollection.document(ID).setData({
      "ID": ID,
    });
  }


  @override
  Widget build(BuildContext context) {
    return new StreamBuilder(
      stream: Firestore.instance
          .collection('Atividades')
          .document(this.day)
          .collection("Atividade")
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return new Text('Loading...');
        return new ListView(
          children: snapshot.data.documents.map((document) {
            return new Card(
              child: ListTile(
                title: new Text(document['Nome']),
                subtitle: new Text(document['Palestrante']),
                leading: Icon(
                  Icons.label_important,
                  color: Colors.blueGrey,
                ),
                                  trailing: IconButton(
                    icon: Icon(Icons.camera, color: Colors.blue),
                    onPressed: () {

                        final CollectionReference credCollection = Firestore.instance.collection("Atividades").document(this.day).collection("Atividade").document(document.documentID).collection("Presença");
                        AtivPageState(this.day).scanQR(context, document['Nome'], credCollection);
                    },
                  ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
