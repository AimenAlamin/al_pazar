import 'package:al_pazar/core/services/data_serivce.dart';

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
  Future<dynamic> getData(
      {required String path, required String documentID}) async {
    var snapshot = await firestore.collection(path).doc(documentID).get();
    return snapshot.data();
  }
}
