abstract class Failure {
  final String message;
  Failure(this.message);
}

//Failure situation when the Either return left, creating it abstract
class ServerFailure extends Failure {
  ServerFailure(
      super.message); //this class extends Failure class and the messges passed to it from my customException class
}
