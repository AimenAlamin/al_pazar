abstract class DatabaseService {
  Future<void> addData({
    required String path,
    Map<String, dynamic>? data,
    String? documentId,
    String? subCollection,
    Map<String, dynamic>? subData,
  }); // here the path can be API endpoint or the path to a colloection or document in the firestore
  Future<dynamic> getData({
    required String path,
    String? documentID,
    Map<String, dynamic>? query,
  }); //general method that fetch data from the path(endpoint/collection/document) and user identifier(token/firebaseUID) and return it

  // New method to fetch documents with their document IDs
  Future<List<Map<String, dynamic>>> getDataWithIds({
    required String path,
    Map<String, dynamic>? query,
  });
}
