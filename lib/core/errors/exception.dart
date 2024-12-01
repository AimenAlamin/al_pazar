class CustomException implements Exception {
  //creating custom exception class that implements the FirebaseAuthException, but Im passing my own messages which are more user friendly
  final String message;

  CustomException({required this.message});

  @override
  String toString() {
    return message; //so no need to do e.toString(), just e.message will be enough and pass it to the Server Failure class in the repo when either return left
  }
}
