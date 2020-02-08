import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  String day;

  DatabaseService(int day){
    this.day = "Dia $day";
  }


  final CollectionReference credCollection = Firestore.instance.collection("Teste_Cred");

  Future updateUserData(String ID) async {
    return await credCollection.document(this.day).collection("User").document(ID).setData({
      "ID": ID,
    });
  }



}
