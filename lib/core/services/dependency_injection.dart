import 'package:al_pazar/core/services/firebase_auth_services.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/repo/auth_repo_impl.dart';
import '../../features/auth/domain/repo/auth_repo.dart';
import 'data_serivce.dart';
import 'firebase_storage.dart';
import 'firestore_service.dart';
import 'storage_service.dart';

final getIt = GetIt.instance;

void setuGetIt() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>(FireStoreService());
  getIt.registerSingleton<StoargeService>(FirebaseStorageService());

  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );
}
