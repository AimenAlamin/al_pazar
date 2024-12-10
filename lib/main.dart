import 'core/helpers/shared_preferences.dart';
import 'firebase_options.dart';
import 'pazar_app.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/routing/app_router.dart';
import 'core/services/custom_bloc_observer.dart';
import 'core/services/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Prefs.init();
  setuGetIt();
  runApp(
    PazarApp(
      appRouter: AppRouter(),
    ),
  );
}
