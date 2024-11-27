import 'package:al_pazar/pazar_app.dart';
import 'package:flutter/material.dart';

import 'core/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // To fix texts being hidden bug in flutter_screenutil in release mode.

  runApp(PazarApp(
    appRouter: AppRouter(),
  ));
}
