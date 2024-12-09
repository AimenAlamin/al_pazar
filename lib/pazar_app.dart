import 'package:al_pazar/core/routing/routes.dart';
import 'package:al_pazar/core/services/firebase_auth_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/app_router.dart';
import 'core/theming/colors.dart';

class PazarApp extends StatelessWidget {
  final AppRouter appRouter;
  const PazarApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: "AlPazar",
        theme: ThemeData(
          primaryColor: ColorsManager.mainBlue,
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.postingScreen,
        // FirebaseAuthService().isUserLoggedIn()
        //     ? Routes.homeScreen
        //     : Routes.loginEmailScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
