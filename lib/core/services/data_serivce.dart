abstract class DatabaseService {
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String?
          documentId}); // here the path can be API endpoint or the path to a colloection or document in the firestore
  Future<dynamic> getData(
      {required String path,
      required String
          documentID}); //general method that fetch data from the path(endpoint/collection/document) and user identifier(token/firebaseUID) and return it as a UserEntity
}
