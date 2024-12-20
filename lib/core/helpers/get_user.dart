import 'dart:convert';
import 'dart:developer';

import 'constants.dart';
import 'shared_preferences.dart';

import '../../features/auth/data/model/user_model.dart';
import '../../features/auth/domain/entity/user_entity.dart';

UserEntity getUserSavedData() {
  var jsonString = Prefs.getString(
      kUserData); //here we fetch the user String data that was set by the shared preferences save Data function
  log('Retrieved jsonString from shared prefs: $jsonString');
  if (jsonString == null || jsonString.isEmpty) {
    throw Exception('No user data found in shared preferences.');
  }
  var userEntity = UserModel.fromJson(jsonDecode(jsonString));
  return userEntity;
}
