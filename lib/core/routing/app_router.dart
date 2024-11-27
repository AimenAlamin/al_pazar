import 'package:al_pazar/core/routing/routes.dart';
import 'package:al_pazar/features/login/login_screen.dart';
import 'package:al_pazar/features/sign_up/ui/sign_up_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    //final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => const SignupScreen(),
        );
      // case Routes.loginScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => getIt<LoginCubit>(),
      //       child: const LoginScreen(),
      //     ),
      //   );
      // case Routes.signUpScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => getIt<SignupCubit>(),
      //       child: const SignupScreen(),
      //     ),
      //   );
      // case Routes.homeScreen:
      //   return MaterialPageRoute(
      //     builder: (_) {
      //       final String name =
      //           settings.arguments as String; // Cast argument to String
      //       return BlocProvider(
      //         create: (context) => HomeCubit(getIt())..getSpecializations(),
      //         child: HomeScreen(name: name), // Pass the name to the HomeScreen
      //       );
      //     },
      //   );

      default:
        return null;
    }
  }
}
