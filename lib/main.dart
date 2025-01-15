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
  // Ensure Flutter widget binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Set the Bloc observer for state management
  Bloc.observer = CustomBlocObserver();

  // Initialize Firebase with platform-specific options
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize shared preferences
  await Prefs.init();

  // Set up dependency injection
  setuGetIt();

  // Run the main application
  runApp(
    PazarApp(
      appRouter: AppRouter(),
    ),
  );
}
