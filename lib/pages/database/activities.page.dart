import 'package:flutter/cupertino.dart';
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


  Map<int, List<DocumentSnapshot>> groupActivities(List<DocumentSnapshot> activities)
  => activities.fold<Map<int, List<DocumentSnapshot>>>({}, (acc, doc) {
    var id = int.parse(doc["ID"])%3;
    if(acc[id] == null) acc[id] = [];
    acc[id].add(doc);
    return acc;
  });

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
          children: groupActivities(snapshot.data.documents).entries.map<Widget>((entry) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Color.fromRGBO(0xF7, 0xF7, 0xF7, 1),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(14.0),
                ),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    DecoratedBox(
                      decoration: BoxDecoration(color: Color.fromRGBO(0xF3, 0xF3, 0xF3, 1)),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 15, 20, 9),
                        child: Text(
                          entry.key.toString(),
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: Color.fromRGBO(0x10, 0x15, 0x4A, 1)
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(19, 19, 19, 0),
                      child: ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: entry.value.length,
                          itemBuilder: (BuildContext ctxt, int index) {
                            var actDoc = entry.value[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 19),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        Text(actDoc['Nome'],
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black
                                          ),
                                        ),
                                        Text(actDoc['Palestrante'],
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

//                                Padding(
//                                    padding: const EdgeInsets.only(left: 8, right: 8),
//                                    child: const Icon(Icons.camera_alt)
//                                ),

                                  SizedBox(
                                      height: 30.0,
                                      width: 35.0,
                                      child: IconButton(
                                        padding: const EdgeInsets.only(left: 8, right: 8),
                                        alignment: Alignment.center,
                                        icon: const Icon(Icons.camera_alt),
                                        onPressed: () async {
                                          final CollectionReference credCollection = Firestore.instance.collection("Atividades").document(this.day).collection("Atividade").document(actDoc.documentID).collection("Presença");
                                          print("teste");
                                          await AtivPageState(this.day).scanQR(context, actDoc['Nome'], credCollection);
                                        },
                                      )
                                  )
                                ],
                              ),
                            );
                          }
                      ),
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
