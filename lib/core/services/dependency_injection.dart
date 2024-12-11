import 'firebase_auth_services.dart';
import '../../features/add_post/domain/repos/images_repo/images_repo.dart';
import '../../features/add_post/domain/repos/images_repo/images_repo_impl.dart';
import '../../features/add_post/domain/repos/posts_repo/post_repo.dart';
import '../../features/add_post/domain/repos/posts_repo/post_repo_impl.dart';
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
  getIt.registerSingleton<ImagesRepo>(
      ImagesRepoImpl(getIt.get<StoargeService>()));
  getIt.registerSingleton<PostRepo>(PostRepoImpl(getIt.get<DatabaseService>()));

  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseService: getIt<
          DatabaseService>(), //because its required we didn't use ".get"getIt.get<DatabaseService>()
    ),
  );
}
