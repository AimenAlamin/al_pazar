import 'package:al_pazar/features/add_post/domain/repos/images_repo/images_repo.dart';
import 'package:al_pazar/features/add_post/domain/repos/posts_repo/post_repo.dart';
import 'package:al_pazar/features/add_post/presenation/manager/cubit/add_post_cubit.dart';
import 'package:al_pazar/features/add_post/presenation/view/add_post_view_body.dart';
import 'package:al_pazar/features/add_post/presenation/view/add_subcategory_screen.dart';
import 'package:al_pazar/features/add_post/presenation/view/add_category_screen.dart';
import 'package:al_pazar/features/add_post/presenation/view/test_screen.dart';
import 'package:al_pazar/features/home/presentation/ui/widgets/home_view.dart';
import 'package:al_pazar/features/post_detials/post_detials_screen.dart';

import 'routes.dart';
import '../../features/collections_all/collection_all_list.dart';
import '../../features/home/presentation/ui/home_main_view.dart';
import '../../features/auth/presentation/login/cubit/login_email_cubit.dart';
import '../../features/auth/presentation/login/ui/loginEmail/login_email_screen.dart';

import '../../features/auth/presentation/sign_up/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';

import '../../features/auth/domain/repo/auth_repo.dart';

import '../../features/auth/presentation/sign_up/ui/widgets/SignUp_Email/sign_up_email_screen.dart';

import '../services/dependency_injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    //final arguments = settings.arguments;

    switch (settings.name) {
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

      case Routes.mainView:
        return MaterialPageRoute(
          builder: (_) => const MainView(),
        );
      case Routes.collectionAllList:
        return MaterialPageRoute(
          builder: (_) => const CollectionAllList(),
        );
      case Routes.addPostViewBody:
        return MaterialPageRoute(
          builder: (_) {
            // Ensure arguments are a Map
            final args = settings.arguments as Map<String, dynamic>;
            final selectedCategory = args['selectedCategory'] as String;
            final selectedSubcategory = args['selectedSubcategory'] as String;
            return BlocProvider(
              create: (context) =>
                  AddPostCubit(getIt.get<ImagesRepo>(), getIt.get<PostRepo>()),
              child: AddPostViewBody(
                  selectedCategory: selectedCategory,
                  selectedSubcategory: selectedSubcategory),
            );
          },
        );
      case Routes.postDetailScreen:
        return MaterialPageRoute(
          builder: (_) => const PostDetialsScreen(),
        );
      case Routes.homeView:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );
      case Routes.addcategoryScreen:
        return MaterialPageRoute(
          builder: (_) => AddCategoryScreen(),
        );
      case Routes.addsubCategoryScreen:
        return MaterialPageRoute(
          builder: (_) {
            return AddSubcategoryScreen(category: settings.arguments as String);
          },
        );
      case Routes.testScreen:
        return MaterialPageRoute(
          builder: (_) {
            // Ensure arguments are a Map
            final args = settings.arguments as Map<String, dynamic>;
            final selectedCategory = args['selectedCategory'] as String;
            final selectedSubcategory = args['selectedSubcategory'] as String;

            return TestScreen(
              selectedCategory: selectedCategory,
              selectedSubcategory: selectedSubcategory,
            );
          },
        );

      // case Routes.onBoardingLoginScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const OnBoardingLoginScreen(),
      //   );
      // case Routes.onBoardingSignupScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const OnBoardingSignupScreen(),
      //   );
      //   case Routes.loginPhoneScreen:
      // return MaterialPageRoute(
      //   builder: (_) => const LoginPhoneScreen(),
      // );
      //  case Routes.signUpPhoneScreen:
      // return MaterialPageRoute(
      //   builder: (_) => const SignupPhoneScreen(),
      // );

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
