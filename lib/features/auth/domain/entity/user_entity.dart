class UserEntity {
  //here I created the UserEntity class that represent my user data, making email & phoneNumber optional because I have both logins with email and phone number
  final String name;
  final String email;
  final String uId;
  //final String? phone;

  UserEntity({required this.name, required this.email, required this.uId});
}
