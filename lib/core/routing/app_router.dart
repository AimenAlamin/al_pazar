import 'package:al_pazar/core/routing/routes.dart';
import 'package:al_pazar/features/login/login_email_screen.dart';
import 'package:al_pazar/features/login/login_phone_screen.dart';
import 'package:al_pazar/features/login/onboarding_login_screen.dart';
import 'package:flutter/material.dart';

import '../../features/sign_up/onboarding_signup_screen.dart';
import '../../features/sign_up/ui/sign_up_email_screen.dart';
import '../../features/sign_up/ui/sign_up_phone_screen.dart';
import '../../features/home/home.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    //final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingLoginScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingLoginScreen(),
        );
      case Routes.onBoardingSignupScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingSignupScreen(),
        );
      case Routes.loginEmailScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginEmailScreen(),
        );
      case Routes.loginPhoneScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginPhoneScreen(),
        );
      case Routes.signUpEmailScreen:
        return MaterialPageRoute(
          builder: (_) => const SignupEmailScreen(),
        );
      case Routes.signUpPhoneScreen:
        return MaterialPageRoute(
          builder: (_) => const SignupPhoneScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const homePage());

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
