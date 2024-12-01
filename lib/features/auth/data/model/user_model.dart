import 'package:al_pazar/features/auth/domain/entity/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity {
  UserModel(
      {required super.name, //here we extend the UserEntity class and we have pass to it the model "using super"
      required super.uId,
      super.email,
      super.phoneNumber});

  factory UserModel.fromFirebaseUser(User user) {
    //here we create a factory constructor to fetch the firebase user to our model
    return UserModel(
      name: user.displayName!,
      uId: user.uid,
      email: user.email,
      phoneNumber: user.phoneNumber,
    );
  }
}
