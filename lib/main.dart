import 'package:al_pazar/firebase_options.dart';
import 'package:al_pazar/pazar_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // To fix texts being hidden bug in flutter_screenutil in release mode.

  runApp(PazarApp(
    appRouter: AppRouter(),
  ));
}
