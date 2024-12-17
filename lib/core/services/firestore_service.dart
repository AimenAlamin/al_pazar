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
  //This method accept query to fetch specific list, accept documentID to document related with the user or specific documentID
  Future<dynamic> getData(
      {required String path,
      String? documentID,
      Map<String, dynamic>? query}) async {
    if (documentID != null) {
      //fetch a specific document, get one item(document)
      var snapshot = await firestore.collection(path).doc(documentID).get();
      //  if (!snapshot.exists) throw Exception('User data not found'); ///////////
      return snapshot.data();
    } else //fetch all documents, get all items(documents)
    {
      Query<Map<String, dynamic>> snapshotlist = firestore.collection(path);
      if (query != null) {
        //fetch from the collection based on the query that I want to retrieve
        if (query['orderBy'] != null) {
          var orderByField = query['orderBy'];
          var newest = query['descending'];
          snapshotlist = snapshotlist.orderBy(orderByField, descending: newest);
          // if(query['limit'] != null)
          // { var limit = query['limit'];
          //   snapshotlist = snapshotlist.limit(limit);
          // }
        }
      }
      //get the data based on the query recieved. if no query is provided, it will get all the data
      var result = await snapshotlist.get();
      return result.docs
          .map((e) => e.data())
          .toList(); //map the data of each document to a list
    }
  }
}
