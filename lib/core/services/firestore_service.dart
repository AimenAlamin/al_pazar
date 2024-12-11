import 'data_serivce.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId}) async {
    if (documentId != null) {
      await firestore.collection(path).doc(documentId).set(
          data); //here if we pass the document(userID), then we will create a document with the userID
    } else {
      await firestore.collection(path).add(
          data); //here if we don't provide the documentID Firebase will automatically generate one, so we can't map the usr with his document
    }
  }

  @override
  Future<dynamic> getData({required String path, String? documentID}) async {
    if (documentID != null) {
      var snapshot = await firestore.collection(path).doc(documentID).get();
      return snapshot.data();
    } else {
      var snapshot = await firestore
          .collection(path)
          .get(); //fetch all documents in the collection
      return snapshot.docs
          .map((e) => e.data())
          .toList(); //map the data of each document to a list
    }
  }
}
