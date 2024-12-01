import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  //here we extend the UserEntity class and we have pass to it the model "using super"
  UserModel({
    required super.name,
    super.email,
    super.phone,
    required super.uId,
  });

  //here we create a factory constructor to fetch the firebase user to our model
  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      name: user.displayName ?? '',
      email: user.email, // For email-based login
      phone: user.phoneNumber, // For phone-based login
      uId: user.uid,
    );
  }

  // From JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      uId: json['uId'],
    );
  }

  // From Entity
  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
      name: user.name,
      email: user.email,
      phone: user.phone,
      uId: user.uId,
    );
  }

  // To Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uId': uId,
    };
  }
}
