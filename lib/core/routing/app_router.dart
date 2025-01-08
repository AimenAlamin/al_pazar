import 'package:al_pazar/features/add_post/domain/repos/images_repo/images_repo.dart';
import 'package:al_pazar/features/add_post/domain/repos/posts_repo/post_repo.dart';
import 'package:al_pazar/features/add_post/presenation/manager/cubit/add_post_cubit.dart';
import 'package:al_pazar/features/add_post/presenation/view/add_post_view_body.dart';
import 'package:al_pazar/features/add_post/presenation/view/add_subcategory_screen.dart';
import 'package:al_pazar/features/add_post/presenation/view/add_category_screen.dart';
import 'package:al_pazar/features/chats/domain/presentation/cubit/chat_cubit.dart';
import 'package:al_pazar/features/chats/domain/repo/chat_repo.dart';
import 'package:al_pazar/features/home/presentation/ui/widgets/categories_see_all.dart';
import 'package:al_pazar/features/home/presentation/ui/widgets/category_filter_view.dart';

import 'package:al_pazar/features/home/presentation/ui/widgets/home_view.dart';

import 'package:al_pazar/features/home/presentation/ui/widgets/sub_categories_see_all.dart';
import 'package:al_pazar/features/post_detials/post_detials_screen.dart';

import '../../features/add_post/domain/entities/post_entity.dart';
import '../../features/chats/domain/presentation/chatroom_list_screen.dart';
import '../../features/chats/domain/presentation/chatroom_screen.dart';
import '../../features/home/presentation/ui/widgets/searchfield/sub_category_filter_view.dart';
import 'routes.dart';

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
          builder: (_) => CategoriesSeeAll(),
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
          builder: (_) => BlocProvider(
            create: (context) => ChatCubit(getIt<ChatRepo>()),
            child: PostDetialsScreen(
                postDetails: settings.arguments as PostEntity),
          ),
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
      case Routes.subCollectionAllList:
        return MaterialPageRoute(
          builder: (_) {
            return SubCategoriesSeeAll(category: settings.arguments as String);
          },
        );
      case Routes.categoryFilterView:
        return MaterialPageRoute(
          builder: (_) {
            return CategoryFilterView(
                categoryName: settings.arguments as String);
          },
        );
      case Routes.subCategoryFilterView:
        return MaterialPageRoute(
          builder: (_) {
            return SubCategoryFilterView(
                subCategoryName: settings.arguments as String);
          },
        );
      case Routes.chatroomListScreen:
        final userID = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ChatCubit(getIt<ChatRepo>()),
            child: ChatroomListScreen(userID: userID),
          ),
        );
      case Routes.chatScreen:
        final args = settings.arguments as Map<String, String>;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ChatCubit(getIt<ChatRepo>()),
            child: ChatScreen(
              chatroomID: args['chatroomID']!,
              recipientName: args['recipientName']!,
              userID: args['userID']!,
            ),
          ),
        );

      default:
        return null;
    }
  }
}
