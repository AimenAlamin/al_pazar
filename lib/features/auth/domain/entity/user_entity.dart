class UserEntity {
  //here I created the UserEntity class that represent my user data, making email & phoneNumber optional because I have both logins with email and phone number
  final String name;
  final String? email;
  final String uId;
  final String? phoneNumber;

  UserEntity(
      {required this.name, this.email, required this.uId, this.phoneNumber});
}
