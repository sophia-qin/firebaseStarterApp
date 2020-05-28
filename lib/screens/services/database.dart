import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasetutorial/models/brew.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference brewCollection = Firestore.instance.collection('brews');

  Future updateUserData(String sugar, String name) async {
    return await brewCollection.document(uid).setData({
      'sugars': sugar,
      'name' : name,
    });
  }
  // brew list from snapshot
  //returns an iterable (converted to list) of items from the database
  List<Brew> _brewListFromShapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Brew(
        name: doc.data['name'] ?? '', //if doesnt exist, make it an empty string
        sugars: doc.data['sugars'] ?? '',
      );
    }).toList();
  }


  // get brews stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromShapshot);
  }

}