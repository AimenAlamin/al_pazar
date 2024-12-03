import 'package:al_pazar/core/routing/routes.dart';
import 'package:al_pazar/features/auth/presentation/home/home_screen.dart';
import 'package:al_pazar/features/auth/presentation/login/cubit/login_email_cubit.dart';
import 'package:al_pazar/features/auth/presentation/login/ui/loginEmail/login_email_screen.dart';
import 'package:al_pazar/features/auth/presentation/login/ui/loginPhone/login_phone_screen.dart';
import 'package:al_pazar/features/auth/presentation/login/onboarding_login_screen.dart';
import 'package:al_pazar/features/auth/presentation/sign_up/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';

import '../../features/auth/domain/repo/auth_repo.dart';
import '../../features/auth/presentation/sign_up/onboarding_signup_screen.dart';
import '../../features/auth/presentation/sign_up/ui/widgets/SignUp_Email/sign_up_email_screen.dart';
import '../../features/auth/presentation/sign_up/ui/widgets/SignUP_Phone/sign_up_phone_screen.dart';
import '../services/dependency_injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    //final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingLoginScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingLoginScreen(),
        );
      // case Routes.onBoardingSignupScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const OnBoardingSignupScreen(),
      //   );
      case Routes.loginEmailScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginEmailCubit(getIt<AuthRepo>()),
            child: const LoginEmailScreen(),
          ),
        );
      case Routes.signUpEmailScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SignUpEmailCubit(getIt<AuthRepo>()),
            child: const SignupEmailScreen(),
          ),
        );
      // case Routes.signUpPhoneScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const SignupPhoneScreen(),
      //   );
      case Routes.loginPhoneScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginPhoneScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
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
