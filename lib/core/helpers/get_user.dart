import 'dart:convert';

import 'constants.dart';
import 'shared_preferences.dart';

import '../../features/auth/data/model/user_model.dart';
import '../../features/auth/domain/entity/user_entity.dart';

UserEntity getUserSavedData() {
  var jsonString = Prefs.getString(
      kUserData); //here we fetch the user String data that was set by the shared preferences save Data function
  var userEntity = UserModel.fromJson(jsonDecode(jsonString));
  return userEntity;
}
