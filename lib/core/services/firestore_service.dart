import 'data_serivce.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({
    required String path,
    Map<String, dynamic>? data,
    String? documentId,
    String? subCollection,
    Map<String, dynamic>? subData,
  }) async {
    if (documentId != null) {
      await firestore.collection(path).doc(documentId).set(data!);
    } else {
      await firestore.collection(path).add(
          data!); //here if we don't provide the documentID Firebase will automatically generate one, so we can't map the usr with a specific document
    }
  }

  @override
  //This method accept query to fetch specific list, accept documentID to document related with the user or specific documentID
  Future<dynamic> getData({
    required String path,
    String? documentID,
    Map<String, dynamic>? query,
  }) async {
    if (documentID != null) {
      // Fetch a specific document
      var snapshot = await firestore.collection(path).doc(documentID).get();
      return snapshot.data();
    } else {
      // Fetch all documents with optional filtering and query
      Query<Map<String, dynamic>> snapshotlist = firestore.collection(path);

      // Apply ordering and limiting conditions
      if (query != null) {
        if (query['orderBy'] != null) {
          var orderByField = query['orderBy'];
          var newest = query['descending'];
          snapshotlist = snapshotlist.orderBy(orderByField, descending: newest);
        }
        if (query['limit'] != null) {
          var limit = query['limit'];
          snapshotlist = snapshotlist.limit(limit);
        }
        if (query['category'] != null) {
          snapshotlist =
              snapshotlist.where('category', isEqualTo: query['category']);
        }
        if (query['subCategory'] != null) {
          snapshotlist = snapshotlist.where('subCategory',
              isEqualTo: query['subCategory']);
        }
        // if (query['category'] != null && query['subCategory'] != null) {
        //   snapshotlist = snapshotlist
        //       .where('category', isEqualTo: query['category'])
        //       .where('subCategory', isEqualTo: query['subCategory']);
        // }
      }

      // Get the data based on the query and filter received
      var result = await snapshotlist.get();
      return result.docs.map((e) => e.data()).toList();
    }
  }
}
